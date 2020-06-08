import 'dart:math';

import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_shadows.dart';
import 'package:fedi/app/ui/page/fedi_sliver_app_bar_bloc.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
import 'package:fedi/ui/scroll_controller_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class FediSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final Widget topBar;
  final Widget expandedAppBarBody;
  final Widget collapsedAppBarBody;
  final double statusBarHeight;
  final double imageDecorationHeight;

  FediSliverAppBar({
    @required this.expandedHeight,
    @required this.topBar,
    @required this.expandedAppBarBody,
    @required this.collapsedAppBarBody,
    @required this.statusBarHeight,
    this.imageDecorationHeight = 200,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    print("$shrinkOffset $overlapsContent");

    var fediSliverAppBarBloc = IFediSliverAppBarBloc.of(context, listen: false);
    fediSliverAppBarBloc.onBuild(minExtent:minExtent, maxExtent:maxExtent,
        shrinkOffset: shrinkOffset, overlapsContent:overlapsContent);

    var expanded = shrinkOffset / expandedHeight == 1;

    var stack = Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        buildCollapsedStatusBar(context, shrinkOffset),
        Positioned(
            top: -shrinkOffset,
            width: MediaQuery.of(context).size.width,
            height: expandedHeight,
            child: buildExpandedAppBar(context, shrinkOffset)),
        buildCollapsedAppBar(context, shrinkOffset),
      ],
    );

    if (expanded) {
      return FediDarkStatusBarStyleArea(child: stack);
    } else {
      if (collapsedAppBarBody == null) {
        return FediLightStatusBarStyleArea(child: stack);
      }

      var scrollControllerBloc =
          IScrollControllerBloc.of(context, listen: false);

      return StreamBuilder<ScrollDirection>(
        stream: scrollControllerBloc.scrollDirectionStream,
        initialData: scrollControllerBloc.scrollDirection,
        builder: (context, snapshot) {
          var scrollDirection = snapshot.data;

          if (scrollDirection != ScrollDirection.reverse &&
              shrinkOffset >= maxExtent - 10) {
            return FediDarkStatusBarStyleArea(child: stack);
          } else {
            return FediLightStatusBarStyleArea(child: stack);
          }
        },
      );
    }
  }

  Widget buildCollapsedAppBar(
    BuildContext context,
    double shrinkOffset,
  ) {
    if (collapsedAppBarBody == null) {
      return SizedBox.shrink();
    }

    var scrollControllerBloc =
        IScrollControllerBloc.of(context, listen: false);

    return Positioned(
      top: max(minExtent, (maxExtent - shrinkOffset)),
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder<ScrollDirection>(
          stream: scrollControllerBloc.scrollDirectionStream,
          initialData: scrollControllerBloc.scrollDirection,
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
    );
  }

  Opacity buildCollapsedStatusBar(BuildContext context, double shrinkOffset) {
    return Opacity(
      //      opacity: shrinkOffset / expandedHeight,
      opacity: shrinkOffset >= expandedHeight -10 ? 1 : 0,
      child: Container(
        width: double.infinity,
        height: statusBarHeight,
//                  height: statusBarHeight,
        color: Colors.white,
      ),
    );
  }

  Opacity buildExpandedAppBar(BuildContext context, double shrinkOffset) {
    return Opacity(
      //      opacity: 1 - shrinkOffset / expandedHeight,
      opacity: 1,
      child: Container(
        height: expandedHeight - 10,
        child: Stack(
          children: [
//            Container(
//              height: imageDecorationHeight,
//              child: FediInstanceImageDecorationWidget(child: Container()),
//            ),
            Padding(
              padding: EdgeInsets.only(top: statusBarHeight),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                    child: topBar,
                  ),
                  if (expandedAppBarBody != null) expandedAppBarBody,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
//  double get minExtent => kToolbarHeight + statusBarHeight;
  double get minExtent => statusBarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
