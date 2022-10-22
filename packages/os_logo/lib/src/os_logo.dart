import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OsLogo extends StatefulWidget {
  const OsLogo.asset({super.key, required this.name, required this.size});

  final String? name;
  final double size;

  @override
  State<OsLogo> createState() => _OsLogoState();
}

class _OsLogoState extends State<OsLogo> {
  String? _svg;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateSvg());
  }

  @override
  void didUpdateWidget(covariant OsLogo oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.name != oldWidget.name) {
      _updateSvg();
    }
  }

  Future<void> _updateSvg() async {
    final svg = await _loadSvg();
    if (!mounted || _svg == svg) return;
    setState(() => _svg = svg);
  }

  Future<String?> _loadSvg() async {
    try {
      final name = widget.name?.toLowerCase();
      if (name != null) {
        final bundle = DefaultAssetBundle.of(context);
        return await bundle.loadString('packages/os_logo/assets/$name.svg');
      }
    } on FlutterError catch (_) {}
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: _svg != null
          ? Padding(
              padding: const EdgeInsets.all(4),
              child: SvgPicture.string(_svg!),
            )
          : null,
    );
  }
}
