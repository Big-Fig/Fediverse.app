import 'dart:math';

import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediCircularProgressIndicator extends StatefulWidget {
  final Color color;
  final double size;

  const FediCircularProgressIndicator({
    this.color = FediColors.darkGrey,
    this.size = 30.0,
  });

  @override
  _FediCircularProgressIndicatorState createState() =>
      _FediCircularProgressIndicatorState();
}

class _FediCircularProgressIndicatorState
    extends State<FediCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * pi,
          child: child,
        );
      },
      child: Icon(
        FediIcons.loading,
        size: widget.size,
        color: widget.color,
      ),
    );
  }
}
