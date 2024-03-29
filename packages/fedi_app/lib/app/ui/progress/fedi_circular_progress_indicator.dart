import 'dart:math';

import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediCircularProgressIndicator extends StatefulWidget {
  final Color? color;
  final double size;

  const FediCircularProgressIndicator({
    Key? key,
    this.color,
    // ignore: no-magic-number
    this.size = 30.0,
  }) : super(key: key);

  static Widget buildForRefreshIndicator(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: IFediUiColorTheme.of(context).white,
          shape: BoxShape.circle,
          border: Border.all(
            color: IFediUiColorTheme.of(context).ultraLightGrey,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: FediCircularProgressIndicator(
            size: 26.0,
          ),
        ),
      );

  @override
  FediCircularProgressIndicatorState createState() =>
      FediCircularProgressIndicatorState();
}

class FediCircularProgressIndicatorState
    extends State<FediCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  // ignore: avoid-late-keyword
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
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
      child: SizedBox(
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
