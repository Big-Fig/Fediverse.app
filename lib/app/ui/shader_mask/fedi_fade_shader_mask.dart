import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediFadeShaderMask extends StatelessWidget {
  final double fadingPercent;
  final Color fadingColor;
  final Widget child;

  FediFadeShaderMask({
    required this.fadingPercent,
    required this.fadingColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              fadingColor.withOpacity(0.0),
              Colors.white,
              Colors.white,
              fadingColor.withOpacity(0.0),
            ],
            stops: [
              0.0,
              fadingPercent,
              1 - fadingPercent,
              1.0,
            ]).createShader(rect);
      },
      child: child,
    );
  }
}
