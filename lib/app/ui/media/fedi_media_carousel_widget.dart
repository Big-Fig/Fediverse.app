import 'package:carousel_slider/carousel_slider.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediMediaCarouselWidget extends StatefulWidget {
  final List<Widget> children;

  FediMediaCarouselWidget({@required this.children});

  @override
  _FediMediaCarouselWidgetState createState() => _FediMediaCarouselWidgetState();
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
              return Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: FediSizes.mediumPadding,
                    horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).backgroundColor,
                    border: Border.all(width: 1.0, color: Colors.white)),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
