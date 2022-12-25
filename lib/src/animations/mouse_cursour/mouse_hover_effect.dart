import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'slideable_container.dart';

class MouseHoverEffect extends StatefulWidget {
  const MouseHoverEffect({super.key, this.child});
  final Widget? child;

  @override
  State<MouseHoverEffect> createState() => _MouseHoverEffectState();
}

class _MouseHoverEffectState extends State<MouseHoverEffect> {
  late double _offsetX;
  late double _offsetY;

  static const double shift = 10;

  @override
  void initState() {
    super.initState();
    _offsetX = -100;
    _offsetY = -100;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: MouseRegion(
        onHover: _onHover,
        onEnter: _onEnter,
        onExit: _onExit,
        hitTestBehavior: HitTestBehavior.opaque,
        opaque: false,
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              if (widget.child != null) widget.child!,
              SlideableContainer(
                offsetX: _offsetX,
                offsetY: _offsetY,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onEnter(PointerEnterEvent enter) {
    _offsetX = 0;
    _offsetY = 0;
    setState(() {});
  }

  _onExit(PointerExitEvent enter) {
    _offsetX = enter.localPosition.dx - shift;
    _offsetY = enter.localPosition.dy - shift;
    setState(() {});
  }

  _onHover(PointerHoverEvent hover) {
    _offsetX = hover.localPosition.dx - shift;
    _offsetY = hover.localPosition.dy - shift;
    setState(() {});
  }
}
