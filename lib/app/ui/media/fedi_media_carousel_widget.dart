import 'package:carousel_slider/carousel_slider.dart';
import 'package:fedi/app/ui/indicator/fedi_indicator_widget.dart';
import 'package:fedi/app/ui/media/fedi_media_carousel_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediMediaCarouselWidget extends StatelessWidget {
  final IndexedWidgetBuilder builder;

  const FediMediaCarouselWidget({
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    var fediMediaCarouselBloc = IFediMediaCarouselBloc.of(context);

    return StreamBuilder<int>(
      stream: fediMediaCarouselBloc.currentIndexStream,
      initialData: fediMediaCarouselBloc.currentIndex,
      builder: (context, snapshot) {
        var currentIndex = snapshot.data;
        return Stack(
          children: [
            CarouselSlider(
              items: fediMediaCarouselBloc.items
                  .asMap()
                  .keys
                  .map(
                    (index) => builder(context, index),
                  )
                  .toList(),
              options: CarouselOptions(
                initialPage: fediMediaCarouselBloc.currentIndex!,
                viewportFraction: 0.9,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  fediMediaCarouselBloc.selectIndex(index);
                },
              ),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 12.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: fediMediaCarouselBloc.items.asMap().keys.map((index) {
                  var active = currentIndex == index;
                  if (active) {
                    return const FediIndicatorWidget(active: true);
                  } else {
                    return const FediIndicatorWidget(active: false);
                  }
                }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
