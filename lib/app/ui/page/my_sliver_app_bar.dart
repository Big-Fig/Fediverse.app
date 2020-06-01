import 'dart:math';

import 'package:fedi/app/instance/fedi_instance_image_decoration_widget.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_shadows.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
import 'package:fedi/ui/scroll_direction_detector_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final Widget topBar;
  final Widget expandedAppBarBody;
  final Widget collapsedAppBarBody;
  final double statusBarHeight;

  MySliverAppBar({
    @required this.expandedHeight,
    @required this.topBar,
    @required this.expandedAppBarBody,
    @required this.collapsedAppBarBody,
    @required this.statusBarHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    print("$shrinkOffset $overlapsContent");

    var scrollDirectionDetector =
        IScrollDirectionDetector.of(context, listen: false);

    var expanded = shrinkOffset / expandedHeight == 1;

    var stack = Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Opacity(
          opacity: 1 - shrinkOffset / expandedHeight,
          child: Container(
            height: expandedHeight - 10,
            child: Stack(
              children: [
                Container(
                  height: 200,
                  child: FediInstanceImageDecorationWidget(child: Container()),
                ),
                Padding(
                  padding: EdgeInsets.only(top: statusBarHeight),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16.0),
                        child: topBar,
                      ),
                      expandedAppBarBody,
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Opacity(
          opacity: shrinkOffset / expandedHeight,
          child: Container(
            width: double.infinity,
            height: statusBarHeight,
//                  height: statusBarHeight,
            color: Colors.white,
          ),
        ),
        Positioned(
          top: max(minExtent, (maxExtent - shrinkOffset)),
          width: MediaQuery.of(context).size.width,
          child: StreamBuilder<ScrollDirection>(
              stream: scrollDirectionDetector.scrollDirectionStream,
              initialData: scrollDirectionDetector.scrollDirection,
              builder: (context, snapshot) {
                var scrollDirection = snapshot.data;

                if (scrollDirection != ScrollDirection.reverse &&
                    shrinkOffset >= maxExtent - 10) {
                  return Container(
//                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: FediColors.white,
                          boxShadow: [FediShadows.forTopBar]),
                      child: collapsedAppBarBody);
                } else {
                  return SizedBox.shrink();
                }
              }),
        ),
//        Positioned(
//          top: minExtent,
//          child: StreamBuilder<ScrollDirection>(
//              stream: scrollDirectionDetector.scrollDirectionStream,
//              initialData: scrollDirectionDetector.scrollDirection,
//              builder: (context, snapshot) {
//                var scrollDirection = snapshot.data;
//
//                Widget child;
//                if (scrollDirection == ScrollDirection.forward) {
//                  child = Container(
//                    width: double.infinity,
//                    height: 50,
//                    color: Colors.white,
//                    child: collapsedAppBarBody,
//                  );
//                } else {
//                  child = Column(
//                    children: [
//                      Container(
//                        width: double.infinity,
//                        height: statusBarHeight,
////                  height: statusBarHeight,
//                        color: Colors.white,
//                      ),
//                      SizedBox(
//                        height: minExtent - statusBarHeight,
//                      )
//                    ],
//                  );
//                }
//
//                return Opacity(
//                  opacity: shrinkOffset / expandedHeight,
//                  child: child,
//                );
//              }),
//        ),
//        Positioned(
////          top: expandedHeight / 2 - shrinkOffset,
////          top: expandedHeight - shrinkOffset + minExtent + 24,
//          top: max(minExtent + 24, 24 + (maxExtent - shrinkOffset)),
//          left: MediaQuery.of(context).size.width / 4,
//          child: Opacity(
//            opacity: 1,
////              (1 - shrinkOffset / expandedHeight),
//            child: Container(
//                color: Colors.red,
//                child: Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Text("atp to load"),
//                )),
//          ),
//        ),
      ],
    );

    if (expanded) {
      return FediDarkStatusBarStyleArea(child: stack);
    } else {
      return FediLightStatusBarStyleArea(child: stack);
//    return stack;

    }
  }

  @override
  double get maxExtent => expandedHeight;

  @override
//  double get minExtent => kToolbarHeight + statusBarHeight;
  double get minExtent => statusBarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
