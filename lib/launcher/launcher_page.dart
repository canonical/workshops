import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wizard_router/wizard_router.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'launcher_model.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
  });

  final Widget title;
  final Widget? content;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.escape): () {
          final wizard = Wizard.of(context);
          if (wizard.hasPrevious) {
            wizard.back();
          } else {
            wizard.done();
          }
        }
      },
      child: Focus(
        autofocus: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                appBarTheme: AppBarTheme(
                  shape: const Border(),
                  titleSpacing: Wizard.of(context).hasPrevious ? 8 : 24,
                ),
              ),
              child: YaruTitleBar(
                title: title,
                centerTitle: false,
                leading: Wizard.of(context).hasPrevious
                    ? Padding(
                        padding: const EdgeInsetsDirectional.only(start: 16),
                        child: Center(
                          child: YaruIconButton(
                            iconSize: 32,
                            padding: EdgeInsets.zero,
                            onPressed: Wizard.of(context).back,
                            icon: const Icon(YaruIcons.go_previous),
                          ),
                        ),
                      )
                    : null,
                trailing: Hero(
                  tag: '$this',
                  child: YaruCloseButton(
                    onPressed: context.read<LauncherModel>().cancel,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: content,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: actions.separated(const SizedBox(width: 8)).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

extension _Separator<T> on Iterable<T> {
  Iterable<T> separated(T separator) {
    return expand((item) sync* {
      yield separator;
      yield item;
    }).skip(1);
  }
}
