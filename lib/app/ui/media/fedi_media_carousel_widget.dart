import 'package:carousel_slider/carousel_slider.dart';
import 'package:fedi/app/ui/indicator/fedi_indicator_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediMediaCarouselWidget extends StatefulWidget {
  final List<Widget> children;

  FediMediaCarouselWidget({@required this.children});

  @override
  _FediMediaCarouselWidgetState createState() =>
      _FediMediaCarouselWidgetState();
}

class _FediMediaCarouselWidgetState extends State<FediMediaCarouselWidget> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: widget.children,
          options: CarouselOptions(
              viewportFraction: 0.9,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Positioned(
          left: 0.0,
          right: 0.0,
          bottom: 12.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: widget.children.map((url) {
              int index = widget.children.indexOf(url);
              var active = _current == index;
              return FediIndicatorWidget(active: active);
            }).toList(),
          ),
        ),
      ],
    );
  }
}
