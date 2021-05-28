import 'package:flutter/material.dart';

// ignore_for_file: no-magic-number, binary-expression-operand-order

class FediChartLineGraphPainterFeature {
  Color color;
  List<double> data;

  FediChartLineGraphPainterFeature({
    required this.color,
    required this.data,
  });
}

class FediChartLineGraphPainter extends CustomPainter {
  final List<FediChartLineGraphPainterFeature>? features;
  final List<String>? labelX;
  final List<String>? labelY;
  final String? fontFamily;
  final Color graphColor;
  final double graphOpacity;

  FediChartLineGraphPainter({
    required this.features,
    required this.labelX,
    required this.labelY,
    required this.fontFamily,
    required this.graphColor,
    required this.graphOpacity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var _offsetX = 1.0;
    for (var i = 0; i < labelY!.length; i++) {
      if (labelY![i].length > _offsetX) {
        _offsetX = labelY![i].length.toDouble();
      }
    }

    _offsetX *= 7;
    _offsetX += size.width * 2 / 20;
    var margin = Size(0, 0);
    var graph = Size(
      size.width - 2 * margin.width,
      size.height - 2 * margin.height,
    );
    var cell = Size(
      graph.width / (labelX!.length - 1),
      graph.height / labelY!.length,
    );

    for (var i = 0; i < features!.length; i++) {
      _drawGraph(
        features![i],
        canvas,
        graph,
        cell,
        margin,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void _drawGraph(
    FediChartLineGraphPainterFeature feature,
    Canvas canvas,
    Size graph,
    Size cell,
    Size margin,
  ) {
    var fillPaint = Paint()
      ..color = feature.color.withOpacity(graphOpacity)
      ..style = PaintingStyle.fill;
    var strokePaint = Paint()
      ..color = feature.color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    var path = Path();
    var linePath = Path();
    path.moveTo(margin.width, graph.height + margin.height);
    path.lineTo(
      margin.width,
      margin.height + graph.height - feature.data[0] * graph.height,
    );
    linePath.moveTo(
      margin.width,
      margin.height + graph.height - feature.data[0] * graph.height,
    );
    var i = 0;
    for (i = 1; i < labelX!.length && i < feature.data.length; i++) {
      if (feature.data[i] > 1) {
        feature.data[i] = 1;
      }
      if (feature.data[i] < 0) {
        feature.data[i] = 0;
      }
      path.lineTo(
        margin.width + i * cell.width,
        margin.height + graph.height - feature.data[i] * graph.height,
      );
      linePath.lineTo(
        margin.width + i * cell.width,
        margin.height + graph.height - feature.data[i] * graph.height,
      );
    }

    path.lineTo(
      margin.width + cell.width * (i - 1),
      margin.height + graph.height,
    );
    canvas.drawPath(path, fillPaint);
    canvas.drawPath(linePath, strokePaint);
  }
}
