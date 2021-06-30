import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediFadeShaderMask extends StatelessWidget {
  final double fadingPercent;
  final Color fadingColor;
  final Widget child;
  final bool onlyEnd;

  final Alignment begin;
  final Alignment end;

  FediFadeShaderMask({
    required this.fadingPercent,
    required this.fadingColor,
    required this.child,
    this.onlyEnd = false,
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: begin,
          end: end,
          colors: [
            if (onlyEnd) Colors.white else fadingColor.withOpacity(0.0),
            Colors.white,
            Colors.white,
            fadingColor.withOpacity(0.0),
          ],
          stops: [
            0.0,
            fadingPercent,
            1 - fadingPercent,
            1.0,
          ],
        ).createShader(rect);
      },
      child: child,
    );
  }
}
