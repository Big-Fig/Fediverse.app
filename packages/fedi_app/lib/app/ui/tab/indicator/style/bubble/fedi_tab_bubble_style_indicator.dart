// ignore_for_file: cascade_invocations

import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Used with [TabBar.indicator] to draw a bubble on the
/// selected tab.
///
/// The [indicatorHeight] defines the bubble height.
/// The [indicatorColor] defines the bubble color.
/// The [indicatorRadius] defines the bubble corner radius.
/// The [tabBarIndicatorSize] specifies the type of TabBarIndicatorSize i.e label or tab.
/// /// The selected tab bubble is inset from the tab's boundary by [insets] when [tabBarIndicatorSize] is tab.
/// The selected tab bubble is applied padding by [padding] when [tabBarIndicatorSize] is label.
class FediTabBubbleStyleIndicator extends Decoration {
  final double indicatorHeight;
  final Color indicatorColor;
  final double indicatorRadius;
  @override
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry insets;
  final TabBarIndicatorSize tabBarIndicatorSize;

  const FediTabBubbleStyleIndicator({
    // ignore: no-magic-number
    this.indicatorHeight = 20.0,
    required this.indicatorColor,
    // ignore: no-magic-number
    this.indicatorRadius = 100.0,
    this.tabBarIndicatorSize = TabBarIndicatorSize.label,
    this.padding = FediPadding.horizontalSmallPadding,
    this.insets = FediPadding.horizontalSmallPadding,
  });

  @override
  Decoration? lerpFrom(Decoration? a, double t) {
    if (a is FediTabBubbleStyleIndicator) {
      return FediTabBubbleStyleIndicator(
        padding: EdgeInsetsGeometry.lerp(a.padding, padding, t)!,
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t)!,
        indicatorColor: a.indicatorColor,
        indicatorHeight: a.indicatorHeight,
        indicatorRadius: a.indicatorRadius,
        tabBarIndicatorSize: a.tabBarIndicatorSize,
      );
    }

    return super.lerpFrom(a, t);
  }

  @override
  Decoration? lerpTo(Decoration? b, double t) {
    if (b is FediTabBubbleStyleIndicator) {
      return FediTabBubbleStyleIndicator(
        padding: EdgeInsetsGeometry.lerp(padding, b.padding, t)!,
        insets: EdgeInsetsGeometry.lerp(insets, b.insets, t)!,
        indicatorColor: b.indicatorColor,
        indicatorHeight: b.indicatorHeight,
        indicatorRadius: b.indicatorRadius,
        tabBarIndicatorSize: b.tabBarIndicatorSize,
      );
    }

    return super.lerpTo(b, t);
  }

  @override
  BubblePainter createBoxPainter([VoidCallback? onChanged]) =>
      BubblePainter(this, onChanged);
}

class BubblePainter extends BoxPainter {
  BubblePainter(this.decoration, VoidCallback? onChanged) : super(onChanged);

  final FediTabBubbleStyleIndicator decoration;

  double get indicatorHeight => decoration.indicatorHeight;

  Color get indicatorColor => decoration.indicatorColor;

  double get indicatorRadius => decoration.indicatorRadius;

  EdgeInsetsGeometry get padding => decoration.padding;

  EdgeInsetsGeometry get insets => decoration.insets;

  TabBarIndicatorSize get tabBarIndicatorSize => decoration.tabBarIndicatorSize;

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    var indicator = padding.resolve(textDirection).inflateRect(rect);

    if (tabBarIndicatorSize == TabBarIndicatorSize.tab) {
      indicator = insets.resolve(textDirection).deflateRect(rect);
    }

    return Rect.fromLTWH(
      indicator.left,
      indicator.top,
      indicator.width,
      indicator.height,
    );
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // ignore: prefer_asserts_with_message
    assert(configuration.size != null);
    final rect = Offset(
          offset.dx,
          // ignore: no-magic-number
          (configuration.size!.height / 2) - indicatorHeight / 2,
        ) &
        Size(configuration.size!.width, indicatorHeight);
    final textDirection = configuration.textDirection!;
    final indicator = _indicatorRectFor(rect, textDirection);
    final paint = Paint();
    paint.color = indicatorColor;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromRectAndRadius(indicator, Radius.circular(indicatorRadius)),
      paint,
    );
  }
}
