import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductLogo extends StatefulWidget {
  const ProductLogo.asset({super.key, required this.name, required this.size});

  final String? name;
  final double size;

  @override
  State<ProductLogo> createState() => _ProductLogoState();
}

class _ProductLogoState extends State<ProductLogo> {
  String? _svg;

  @override
  void initState() {
    super.initState();
    _updateSvg();
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
        return await bundle.loadString('assets/$name.svg');
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

  @override
  void didUpdateWidget(covariant ProductLogo oldWidget) {
    if (widget.name != oldWidget.name) {
      _updateSvg();
    }
    super.didUpdateWidget(oldWidget);
  }
}
