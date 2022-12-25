import 'package:flutter/material.dart';

class SlideableContainer extends StatefulWidget {
  const SlideableContainer({
    super.key,
    required this.offsetX,
    required this.offsetY,
  });
  final double offsetY;
  final double offsetX;

  @override
  State<SlideableContainer> createState() => _SlideableContainerState();
}

class _SlideableContainerState extends State<SlideableContainer>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late CurvedAnimation _curvedAnimation;
  late Animation<Offset> _animation;
  late double _oldOffsetX;
  late double _oldOffsetY;

  @override
  void initState() {
    super.initState();

    _oldOffsetX = widget.offsetX;
    _oldOffsetY = widget.offsetY;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastLinearToSlowEaseIn,
    );

    _animate(Offset(_oldOffsetX, _oldOffsetY));
  }

  _animate(Offset endValue) {
    _animation = Tween<Offset>(
      begin: Offset(_oldOffsetX, _oldOffsetY),
      end: endValue,
    ).animate(_curvedAnimation);

    _controller.reset();
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant SlideableContainer oldWidget) {
    if (_oldOffsetX == widget.offsetX && _oldOffsetY == widget.offsetY) return;

    final newX = widget.offsetX;
    final newY = widget.offsetY;

    _animate(Offset(newX, newY));

    _oldOffsetX = newX;
    _oldOffsetY = newY;

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..translate(_animation.value.dx, _animation.value.dy)
        ..scale(1.5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.25),
          shape: BoxShape.circle,
        ),
        width: 24,
        height: 24,
      ),
    );
  }
}
