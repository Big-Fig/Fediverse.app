import 'package:carousel_slider/carousel_slider.dart';
import 'package:fedi/app/ui/indicator/fedi_indicator_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediMediaCarouselWidget extends StatefulWidget {
  final List<Widget> children;
  final int initialPageIndex;

  FediMediaCarouselWidget({
    @required this.children,
    @required this.initialPageIndex,
  });

  @override
  _FediMediaCarouselWidgetState createState() => _FediMediaCarouselWidgetState(
        currentPageIndex: initialPageIndex,
      );
}

class _FediMediaCarouselWidgetState extends State<FediMediaCarouselWidget> {
  int currentPageIndex;

  _FediMediaCarouselWidgetState({this.currentPageIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: widget.children,
          options: CarouselOptions(
              initialPage: currentPageIndex,
              viewportFraction: 0.9,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  currentPageIndex = index;
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
              var active = currentPageIndex == index;
              return FediIndicatorWidget(active: active);
            }).toList(),
          ),
        ),
      ],
    );
  }
}
