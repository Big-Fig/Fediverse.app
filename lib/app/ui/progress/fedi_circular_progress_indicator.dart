import 'dart:math';

import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediCircularProgressIndicator extends StatefulWidget {
  final Color? color;
  final double size;

  const FediCircularProgressIndicator({
    this.color,
    // ignore: no-magic-number
    this.size = 30.0,
  });

  static Widget buildForRefreshIndicator(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: IFediUiColorTheme.of(context).white,
          shape: BoxShape.circle,
          border: Border.all(
            color: IFediUiColorTheme.of(context).ultraLightGrey,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const FediCircularProgressIndicator(
            size: 26.0,
          ),
        ),
      );

  @override
  _FediCircularProgressIndicatorState createState() =>
      _FediCircularProgressIndicatorState();
}

class _FediCircularProgressIndicatorState
    extends State<FediCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  // ignore: avoid-late-keyword
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        // ignore: no-magic-number
        seconds: 2,
      ),
      // ignore: no-magic-number
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
      builder: (_, child) => Transform.rotate(
        angle: _controller.value,
        child: child,
      ),
      child: Container(
        width: size,
        // ignore: no-equal-arguments
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
