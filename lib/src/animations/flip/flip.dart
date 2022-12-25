import 'dart:math';

import 'package:flutter/material.dart';

class FlipAnimation extends StatefulWidget {
  const FlipAnimation({super.key});

  @override
  State<FlipAnimation> createState() => _FlipAnimationState();
}

class _FlipAnimationState extends State<FlipAnimation> {
  bool first = true;

  late bool _displayFront;
  late bool _xAxis;

  @override
  void initState() {
    super.initState();
    _displayFront = true;
    _xAxis = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => setState(() {
            _displayFront = !_displayFront;
          }),
          onHorizontalDragEnd: (event) {
            setState(() {
              _xAxis = true;
              _displayFront = !_displayFront;
            });
          },
          onVerticalDragEnd: (event) {
            setState(() {
              _xAxis = false;
              _displayFront = !_displayFront;
            });
          },
          child: AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            transitionBuilder: _transitionBuilder,
            layoutBuilder: (currentChild, previousChildren) => Stack(
              children: [currentChild!, ...previousChildren],
            ),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeIn.flipped,
            child: _displayFront ? _buildFront() : _buildRear(),
          ),
        ),
      ),
    );
  }

  Widget __buildLayout(Key key, Color backgroundColor, String faceName) {
    return Container(
      key: key,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      height: 200,
      width: 200,
      child: Center(
        child: Text(
          faceName.substring(0, 1),
          style: const TextStyle(fontSize: 80.0),
        ),
      ),
    );
  }

  Widget _buildFront() {
    return __buildLayout(
      const ValueKey(true),
      Colors.blue,
      "F",
    );
  }

  Widget _buildRear() {
    return __buildLayout(
      const ValueKey(false),
      Colors.blue.shade700,
      "R",
    );
  }

  Widget _transitionBuilder(Widget child, Animation<double> animation) {
    final rotation = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotation,
      child: child,
      builder: (context, childWidget) {
        final isUnder = (ValueKey(_displayFront) != child.key);

        final value = isUnder ? min(rotation.value, pi / 2) : rotation.value;

        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;

        tilt *= isUnder ? -1 : 1;

        return Transform(
          transform: !_xAxis
              ? (Matrix4.rotationX(value)
                ..setEntry(
                  3,
                  1,
                  tilt,
                ))
              : (Matrix4.rotationY(value)
                ..setEntry(
                  3,
                  0,
                  tilt,
                )),
          alignment: Alignment.center,
          child: childWidget,
        );
      },
    );
  }
}
