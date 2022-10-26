#include "include/gio_settings/gio_settings_plugin.h"

#include <flutter_linux/flutter_linux.h>
#include <gtk/gtk.h>

struct _GioSettingsPlugin {
  GObject parent_instance;
  GHashTable* settings;
  FlEventChannel* event_channel;
};

G_DEFINE_TYPE(GioSettingsPlugin, gio_settings_plugin, g_object_get_type())

static const gchar* get_schema_id(FlValue* args) {
  FlValue* schema_id = fl_value_lookup_string(args, "schemaId");
  return fl_value_get_string(schema_id);
}

static const gchar* get_path(FlValue* args) {
  FlValue* path = fl_value_lookup_string(args, "path");
  if (path == nullptr || fl_value_get_type(path) != FL_VALUE_TYPE_STRING) {
    return nullptr;
  }
  return fl_value_get_string(path);
}

static gchar* build_key(FlValue* args) {
  return g_strdup_printf("%s %s", get_schema_id(args), get_path(args));
}

static GSettings* create_settings(FlValue* args) {
  const gchar* schema_id = get_schema_id(args);
  const gchar* path = get_path(args);
  if (path == nullptr) {
    return g_settings_new(schema_id);
  }
  return g_settings_new_with_path(schema_id, path);
}

FlMethodResponse* list_keys(FlValue* args) {
  g_autoptr(GSettings) settings = create_settings(args);
  g_autoptr(GSettingsSchema) settings_schema = nullptr;
  g_object_get(settings, "settings-schema", &settings_schema, nullptr);
  gchar** keys = g_settings_schema_list_keys(settings_schema);
  g_autoptr(FlValue) value = fl_value_new_list_from_strv(keys);
  g_strfreev(keys);
  return FL_METHOD_RESPONSE(fl_method_success_response_new(value));
}

FlValue* to_fl_value(GVariant* variant) {
  if (variant == nullptr) {
    return fl_value_new_null();
  }
  if (g_variant_is_of_type(variant, G_VARIANT_TYPE_BOOLEAN)) {
    return fl_value_new_bool(g_variant_get_boolean(variant));
  }
  if (g_variant_is_of_type(variant, G_VARIANT_TYPE_INT32)) {
    return fl_value_new_int(g_variant_get_int32(variant));
  }
  if (g_variant_is_of_type(variant, G_VARIANT_TYPE_UINT32)) {
    return fl_value_new_int(g_variant_get_uint32(variant));
  }
  if (g_variant_is_of_type(variant, G_VARIANT_TYPE_DOUBLE)) {
    return fl_value_new_float(g_variant_get_double(variant));
  }
  if (g_variant_is_of_type(variant, G_VARIANT_TYPE_STRING)) {
    return fl_value_new_string(g_variant_get_string(variant, nullptr));
  }
  if (g_variant_is_of_type(variant, G_VARIANT_TYPE_STRING_ARRAY)) {
    const gchar** strv = g_variant_get_strv(variant, nullptr);
    FlValue* value = fl_value_new_list_from_strv(strv);
    g_free(strv);
    return value;
  }
  return nullptr;
}

static GVariant* to_g_variant(FlValue* value) {
  switch (fl_value_get_type(value)) {
    case FL_VALUE_TYPE_BOOL:
      return g_variant_new_boolean(fl_value_get_bool(value));
    case FL_VALUE_TYPE_INT:
      return g_variant_new_int32(fl_value_get_int(value));
    case FL_VALUE_TYPE_FLOAT:
      return g_variant_new_double(fl_value_get_float(value));
    case FL_VALUE_TYPE_STRING:
      return g_variant_new_string(fl_value_get_string(value));
    case FL_VALUE_TYPE_LIST: {
      g_autoptr(GStrvBuilder) builder = g_strv_builder_new();
      gsize length = fl_value_get_length(value);
      for (gsize i = 0; i < length; ++i) {
        FlValue* child = fl_value_get_list_value(value, i);
        g_strv_builder_add(builder, fl_value_get_string(child));
      }
      return g_variant_new_strv(g_strv_builder_end(builder), length);
    }
    default:
      return nullptr;
  }
}

FlMethodResponse* get_value(FlValue* args) {
  FlValue* key = fl_value_lookup_string(args, "key");
  g_autoptr(GSettings) settings = create_settings(args);
  g_autoptr(GVariant) variant =
      g_settings_get_value(settings, fl_value_get_string(key));
  g_autoptr(FlValue) value = to_fl_value(variant);
  return FL_METHOD_RESPONSE(fl_method_success_response_new(value));
}

FlMethodResponse* get_default_value(FlValue* args) {
  FlValue* key = fl_value_lookup_string(args, "key");
  g_autoptr(GSettings) settings = create_settings(args);
  g_autoptr(GVariant) variant =
      g_settings_get_default_value(settings, fl_value_get_string(key));
  g_autoptr(FlValue) value = to_fl_value(variant);
  return FL_METHOD_RESPONSE(fl_method_success_response_new(value));
}

FlMethodResponse* set_value(FlValue* args) {
  FlValue* key = fl_value_lookup_string(args, "key");
  FlValue* value = fl_value_lookup_string(args, "value");
  g_autoptr(GSettings) settings = create_settings(args);
  g_autoptr(GVariant) variant = to_g_variant(value);
  g_settings_set_value(settings, fl_value_get_string(key), variant);
  return FL_METHOD_RESPONSE(fl_method_success_response_new(nullptr));
}

FlMethodResponse* unset_value(FlValue* args) {
  FlValue* key = fl_value_lookup_string(args, "key");

  g_autoptr(GSettings) settings = create_settings(args);
  g_settings_reset(settings, fl_value_get_string(key));
  return FL_METHOD_RESPONSE(fl_method_success_response_new(nullptr));
}

static void settings_changed_cb(GSettings* settings, gchar* key,
                                gpointer user_data) {
  GioSettingsPlugin* plugin = GIO_SETTINGS_PLUGIN(user_data);

  g_autoptr(FlValue) args = fl_value_new_map();

  FlValue* keys = fl_value_new_list();
  fl_value_append_take(keys, fl_value_new_string(key));
  fl_value_set_string_take(args, "keys", keys);

  gchar* schema_id = nullptr;
  gchar* path = nullptr;
  g_object_get(settings, "schema_id", &schema_id, "path", &path, nullptr);
  fl_value_set_string_take(args, "schemaId", fl_value_new_string(schema_id));
  fl_value_set_string_take(args, "path", fl_value_new_string(path));

  fl_event_channel_send(plugin->event_channel, args, nullptr, nullptr);
}

FlMethodResponse* subscribe(GioSettingsPlugin* self, FlValue* args) {
  g_autofree gchar* key = build_key(args);
  gpointer settings = g_hash_table_lookup(self->settings, key);
  if (settings == nullptr) {
    settings = create_settings(args);
    g_signal_connect(settings, "changed", G_CALLBACK(settings_changed_cb),
                     self);
    g_hash_table_insert(self->settings, g_strdup(key), settings);
  } else {
    g_object_ref(settings);
  }
  return FL_METHOD_RESPONSE(fl_method_success_response_new(nullptr));
}

FlMethodResponse* unsubscribe(GioSettingsPlugin* self, FlValue* args) {
  g_autofree gchar* key = build_key(args);
  gpointer settings = g_hash_table_lookup(self->settings, key);
  if (settings != nullptr) {
    g_object_unref(settings);
    if (!G_IS_OBJECT(settings)) {
      g_hash_table_remove(self->settings, key);
    }
  }
  return FL_METHOD_RESPONSE(fl_method_success_response_new(nullptr));
}

// Called when a method call is received from Flutter.
static void gio_settings_plugin_handle_method_call(GioSettingsPlugin* self,
                                                   FlMethodCall* method_call) {
  g_autoptr(FlMethodResponse) response = nullptr;

  const gchar* method = fl_method_call_get_name(method_call);
  FlValue* args = fl_method_call_get_args(method_call);

  if (strcmp(method, "list") == 0) {
    response = list_keys(args);
  } else if (strcmp(method, "get") == 0) {
    response = get_value(args);
  } else if (strcmp(method, "getDefault") == 0) {
    response = get_default_value(args);
  } else if (strcmp(method, "set") == 0) {
    response = set_value(args);
  } else if (strcmp(method, "unset") == 0) {
    response = unset_value(args);
  } else if (strcmp(method, "subscribe") == 0) {
    response = subscribe(self, args);
  } else if (strcmp(method, "unsubscribe") == 0) {
    response = unsubscribe(self, args);
  } else {
    response = FL_METHOD_RESPONSE(fl_method_not_implemented_response_new());
  }

  fl_method_call_respond(method_call, response, nullptr);
}

static void gio_settings_plugin_dispose(GObject* object) {
  GioSettingsPlugin* self = GIO_SETTINGS_PLUGIN(object);
  g_hash_table_destroy(self->settings);
  self->settings = nullptr;

  G_OBJECT_CLASS(gio_settings_plugin_parent_class)->dispose(object);
}

static void gio_settings_plugin_class_init(GioSettingsPluginClass* klass) {
  G_OBJECT_CLASS(klass)->dispose = gio_settings_plugin_dispose;
}

static void gio_settings_plugin_init(GioSettingsPlugin* self) {
  self->settings = g_hash_table_new(g_str_hash, g_str_equal);
}

static void method_call_cb(FlMethodChannel* channel, FlMethodCall* method_call,
                           gpointer user_data) {
  GioSettingsPlugin* plugin = GIO_SETTINGS_PLUGIN(user_data);
  gio_settings_plugin_handle_method_call(plugin, method_call);
}

static FlMethodErrorResponse* listen_events_cb(FlEventChannel* channel,
                                               FlValue* args,
                                               gpointer user_data) {
  return nullptr;
}

static FlMethodErrorResponse* cancel_events_cb(FlEventChannel* channel,
                                               FlValue* args,
                                               gpointer user_data) {
  return nullptr;
}

void gio_settings_plugin_register_with_registrar(FlPluginRegistrar* registrar) {
  g_autoptr(GioSettingsPlugin) plugin = GIO_SETTINGS_PLUGIN(
      g_object_new(gio_settings_plugin_get_type(), nullptr));

  g_autoptr(FlStandardMethodCodec) codec = fl_standard_method_codec_new();
  FlBinaryMessenger* messenger = fl_plugin_registrar_get_messenger(registrar);

  g_autoptr(FlMethodChannel) method_channel =
      fl_method_channel_new(messenger, "gio_settings", FL_METHOD_CODEC(codec));
  fl_method_channel_set_method_call_handler(
      method_channel, method_call_cb, g_object_ref(plugin), g_object_unref);

  plugin->event_channel = fl_event_channel_new(messenger, "gio_settings/events",
                                               FL_METHOD_CODEC(codec));
  fl_event_channel_set_stream_handlers(plugin->event_channel, listen_events_cb,
                                       cancel_events_cb, g_object_ref(plugin),
                                       g_object_unref);
}
