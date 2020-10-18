import 'dart:math';

import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediCircularProgressIndicator extends StatefulWidget {
  final Color color;
  final double size;

  const FediCircularProgressIndicator({
    this.color,
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

    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
      upperBound: pi * 2,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var color = widget.color ?? IFediUiColorTheme.of(context).darkGrey;
    var size = widget.size;
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value,
          child: child,
        );
      },
      child: Container(
        width: size,
        height: size,
        child: Icon(
          FediIcons.loading,
          size: size,
          color: color,
        ),
      ),
    );
  }
}
