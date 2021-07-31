import 'package:fedi/app/app_model.dart';
import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/ui/list/fedi_list_smart_refresher_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:logging/logging.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

var _logger = Logger('fedi_list_smart_refresher_widget.dart');

class FediListSmartRefresherWidget extends StatelessWidget {
  final Widget child;
  final Widget? header;
  final Widget? footer;
  final bool enablePullUp;
  final bool enableTwoLevel;
  final bool enablePullDown;
  final Future<FediListSmartRefresherLoadingState> Function()? onRefresh;
  final Future<FediListSmartRefresherLoadingState> Function()? onLoading;
  final Future<bool> Function()? onTwoLevel;
  final RefreshController controller;
  final Axis? scrollDirection;
  final bool? reverse;
  final ScrollController? scrollController;
  final bool? primary;
  final ScrollPhysics? physics;
  final double? cacheExtent;
  final int? semanticChildCount;
  final DragStartBehavior? dragStartBehavior;
  final bool isNeedToAddPaddingForUiTests;

  FediListSmartRefresherWidget({
    Key? key,
    required this.controller,
    required this.child,
    this.header,
    this.footer,
    this.enablePullDown = true,
    this.enablePullUp = false,
    this.enableTwoLevel = false,
    required this.onRefresh,
    required this.onLoading,
    this.onTwoLevel,
    this.dragStartBehavior,
    this.primary,
    this.cacheExtent,
    this.semanticChildCount,
    this.reverse,
    this.physics,
    this.scrollDirection,
    this.scrollController,
    required this.isNeedToAddPaddingForUiTests,
  });

  @override
  Widget build(BuildContext context) {
    var configService = IConfigService.of(context);
    if (configService.appLaunchType == AppLaunchType.mock) {
      // todo: remove hack
      // SmartRefresher broke UI tests
      // https://github.com/peng8350/flutter_pulltorefresh/issues/504
      return Container(
        //
        transform: isNeedToAddPaddingForUiTests
            // it is top margin remove for some pages,
            // because SmartRefresher have similar negative padding
            // ignore: no-magic-number
            ? Matrix4.translationValues(0.0, -25.0, 0.0)
            : null,
        child: child,
      );
    }

    return SmartRefresher(
      key: key,
      controller: controller,
      header: header,
      footer: footer,
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp,
      enableTwoLevel: enableTwoLevel,
      onRefresh: () async {
        if (onRefresh != null) {
          var state = await onRefresh!();
          _logger.finest(() => 'onRefresh $state');
        }
      },
      onLoading: () async {
        if (onLoading != null) {
          var state = await onLoading!();
          _logger.finest(() => 'onLoading $state');
        }
      },
      dragStartBehavior: dragStartBehavior,
      primary: primary,
      cacheExtent: cacheExtent,
      semanticChildCount: semanticChildCount,
      reverse: reverse,
      physics: physics,
      scrollDirection: scrollDirection,
      scrollController: scrollController,
      child: child,
    );
  }
}
