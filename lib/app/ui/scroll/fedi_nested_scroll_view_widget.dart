import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_bloc.dart';
import 'package:fedi/app/ui/status_bar/fedi_white_status_bar_widget.dart';
import 'package:fedi/ui/scroll/scroll_controller_bloc.dart';
import 'package:fedi/ui/scroll/unfocus_on_scroll_area_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("fedi_nested_scroll_view_widget.dart");

typedef NestedScrollViewContentBuilder = Function(BuildContext context);
typedef NestedScrollViewOverlayBuilder = Function(
    BuildContext context, bool isInSafeArea);

abstract class FediNestedScrollViewWidget extends StatelessWidget {
  final Widget onLongScrollUpTopOverlayWidget;
  final List<Widget> topSliverWidgets;
  final double topSliverScrollOffsetToShowWhiteStatusBar;

  FediNestedScrollViewWidget({
    @required this.onLongScrollUpTopOverlayWidget,
    @required this.topSliverWidgets,
    @required this.topSliverScrollOffsetToShowWhiteStatusBar,
  });

  @override
  Widget build(BuildContext context) {
    var fediNestedScrollViewBloc = IFediNestedScrollViewBloc.of(context);

    return Stack(
      children: [
        UnfocusOnScrollAreaWidget(
          child: buildNestedScrollView(
            context,
          ),
        ),
        if (topSliverScrollOffsetToShowWhiteStatusBar != null)
          buildTopSliverOffsetWhiteStatusBar(fediNestedScrollViewBloc)
      ],
    );
  }

  Widget buildTopSliverOffsetWhiteStatusBar(
          IFediNestedScrollViewBloc fediNestedScrollViewBloc) =>
      StreamBuilder<bool>(stream:
          fediNestedScrollViewBloc.scrollOffsetStream.map((expandOffset) {
        if (expandOffset != null &&
            expandOffset > topSliverScrollOffsetToShowWhiteStatusBar) {
          return true;
        } else {
          return false;
        }
      }), builder: (context, snapshot) {
        var isNeedShow = snapshot.data;
        if (isNeedShow == true) {
          return const FediWhiteStatusBarWidget();
        } else {
          return const SizedBox.shrink();
        }
      });

  List<Widget> buildTopSliverWidgets(BuildContext context) => [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                  ),
                  child: Column(
                    children: topSliverWidgets,
                  )),
            ],
          ),
        )
      ];

  Widget buildNestedScrollView(BuildContext context);

  static Widget buildOnLongScrollUpTopOverlayWidget(
      BuildContext context, Widget onLongScrollUpTopOverlayWidget) {
    var fediNestedScrollViewBloc =
        IFediNestedScrollViewBloc.of(context, listen: false);
    var scrollControllerBloc = IScrollControllerBloc.of(context, listen: false);

    return StreamBuilder<bool>(
        stream: Rx.combineLatest2(
            scrollControllerBloc.longScrollDirectionStream,
            fediNestedScrollViewBloc.isNestedScrollViewBodyStartScrollStream,
            (scrollDirection, isAtLeastStartExpand) {
          _logger.finest(() => "scrollDirection $scrollDirection "
              "$isAtLeastStartExpand");

          return scrollDirection == ScrollDirection.forward &&
              isAtLeastStartExpand == false;
        }),
        builder: (context, snapshot) {
          var show = snapshot.data;
          _logger.finest(() => "show $show");
          if (show == true) {
            return onLongScrollUpTopOverlayWidget;
          } else {
            return const SizedBox.shrink();
          }
        });
  }

  static Widget buildOverlay(BuildContext context,
      NestedScrollViewOverlayBuilder tabBodyOverlayBuilder) {
    var scrollControllerBloc = IScrollControllerBloc.of(context, listen: false);
    var fediNestedScrollViewBloc =
        IFediNestedScrollViewBloc.of(context, listen: false);
    return StreamBuilder<bool>(
        stream: Rx.combineLatest2(
            scrollControllerBloc.longScrollDirectionStream,
            fediNestedScrollViewBloc.isNestedScrollViewBodyStartScrollStream,
            (longScrollDirection, isAtLeastStartExpand) {
          _logger.finest(() => "longScrollDirection $longScrollDirection "
              "isAtLeastStartExpand $isAtLeastStartExpand");

          var collapsedAppBarShowed =
              longScrollDirection == ScrollDirection.forward;
          var expandedAppBarShowed = isAtLeastStartExpand == true;
          var isInSafeArea = collapsedAppBarShowed || expandedAppBarShowed;
          return isInSafeArea;
        }),
        builder: (context, snapshot) {
          var isInSafeArea = snapshot.data;

          return tabBodyOverlayBuilder(context, isInSafeArea);
        });
  }

}
