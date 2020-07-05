import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/ui/notification_overlay/error_fedi_notification_overlay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:logging/logging.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

var _logger = Logger("fedi_list_smart_refresher_widget.dart");

class FediListSmartRefresherWidget extends StatelessWidget {
  final Widget child;
  final Widget header;
  final Widget footer;
  final bool enablePullUp;
  final bool enableTwoLevel;
  final bool enablePullDown;
  final Future<bool> Function() onRefresh;
  final Future<bool> Function() onLoading;
  final Future<bool> Function() onTwoLevel;
  final OnOffsetChange onOffsetChange;
  final RefreshController controller;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController scrollController;
  final bool primary;
  final ScrollPhysics physics;
  final double cacheExtent;
  final int semanticChildCount;
  final DragStartBehavior dragStartBehavior;

  FediListSmartRefresherWidget({
    Key key,
    @required this.controller,
    this.child,
    this.header,
    this.footer,
    this.enablePullDown = true,
    this.enablePullUp = false,
    this.enableTwoLevel = false,
    @required this.onRefresh,
    @required this.onLoading,
    this.onTwoLevel,
    this.onOffsetChange,
    this.dragStartBehavior,
    this.primary,
    this.cacheExtent,
    this.semanticChildCount,
    this.reverse,
    this.physics,
    this.scrollDirection,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) => SmartRefresher(
        key: key,
        controller: controller,
        child: child,
        header: header,
        footer: footer,
        enablePullDown: enablePullDown,
        enablePullUp: enablePullUp,
        enableTwoLevel: enableTwoLevel,
        onRefresh: () async {
          if (onRefresh != null) {
            var success = await onRefresh();
            _logger.finest(() => "onRefresh $success");
            if (!success) {
              showErrorFediNotificationOverlay(
                  contentText: "app.list.refresh.unable_to_fetch".tr(),
                  titleText: null);
            }
          }
        },
        onLoading: () async {
          if (onLoading != null) {
            var success = await onLoading();
            if (!success) {
              showErrorFediNotificationOverlay(
                  contentText: "app.list.loading.state.failed".tr(),
                  titleText: null);
            }
          }
        },
        onTwoLevel: onTwoLevel,
        onOffsetChange: onOffsetChange,
        dragStartBehavior: dragStartBehavior,
        primary: primary,
        cacheExtent: cacheExtent,
        semanticChildCount: semanticChildCount,
        reverse: reverse,
        physics: physics,
        scrollDirection: scrollDirection,
        scrollController: scrollController,
      );
}
