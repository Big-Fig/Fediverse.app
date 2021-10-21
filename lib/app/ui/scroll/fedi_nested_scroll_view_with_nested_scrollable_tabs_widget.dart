import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart'
    as extended_nested_scroll_view;
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_bloc.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_widget.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' hide NestedScrollView;
import 'package:logging/logging.dart';

var _logger =
    Logger('fedi_nested_scroll_view_with_nested_scrollable_tabs_widget.dart');

typedef TabBarViewContainerBuilder = Widget Function(
  BuildContext context,
  Widget child,
);

typedef TabBodyProviderBuilder = Widget Function(
  BuildContext context,
  int index,
  Widget child,
);
typedef TabBodyContentBuilder = Widget Function(
  BuildContext context,
  int index,
);
typedef TabBodyOverlayBuilder = Widget Function(
  BuildContext context,
  int index,
);

typedef TabsEmptyBuilder = Widget Function(BuildContext context);

class FediNestedScrollViewWithNestedScrollableTabsWidget
    extends FediNestedScrollViewWidget {
  final String tabKeyPrefix;

  final TabBodyProviderBuilder tabBodyProviderBuilder;
  final TabBodyContentBuilder tabBodyContentBuilder;
  final TabBodyOverlayBuilder tabBodyOverlayBuilder;
  final TabBarViewContainerBuilder? tabBarViewContainerBuilder;
  final TabsEmptyBuilder? tabsEmptyBuilder;

  const FediNestedScrollViewWithNestedScrollableTabsWidget({
    Key? key,
    required Widget? onLongScrollUpTopOverlayWidget,
    required List<Widget> topSliverWidgets,
    required double? topSliverScrollOffsetToShowWhiteStatusBar,
    required this.tabKeyPrefix,
    required this.tabBarViewContainerBuilder,
    required this.tabBodyProviderBuilder,
    required this.tabBodyContentBuilder,
    required this.tabBodyOverlayBuilder,
    this.tabsEmptyBuilder,
  }) : super(
          key: key,
          onLongScrollUpTopOverlayWidget: onLongScrollUpTopOverlayWidget,
          topSliverWidgets: topSliverWidgets,
          topSliverScrollOffsetToShowWhiteStatusBar:
              topSliverScrollOffsetToShowWhiteStatusBar,
        );

  Key _innerScrollPositionKeyBuilder(BuildContext context) {
    var fediNestedScrollViewWithNestedScrollableTabsBloc =
        IFediNestedScrollViewWithNestedScrollableTabsBloc.of(
      context,
      listen: false,
    );

    return _calculateTabKey(
      tabKeyPrefix,
      fediNestedScrollViewWithNestedScrollableTabsBloc.tabController.index,
    );
  }

  @override
  Widget buildNestedScrollView(
    BuildContext context,
  ) {
    var fediNestedScrollViewBloc =
        IFediNestedScrollViewBloc.of(context, listen: false);
    var nestedScrollController =
        fediNestedScrollViewBloc.nestedScrollController;
    // extended_nested_scroll_view required to fix nested scrollables sync issue

    return extended_nested_scroll_view.NestedScrollView(
      // we use custom nested scroll controller to achieve scroll callbacks
      // from body scrollables
      controller: nestedScrollController,
      headerSliverBuilder: (BuildContext context, bool? innerBoxIsScrolled) =>
          buildTopSliverWidgets(context),
      innerScrollPositionKeyBuilder: () =>
          _innerScrollPositionKeyBuilder(context),
      body: Builder(
        builder: (context) {
          // required by extended_nested_scroll_view
          nestedScrollController!.enableScroll(context);

          return _NestedBodyWidget(
            tabKeyPrefix: tabKeyPrefix,
            onLongScrollUpTopOverlayWidget: onLongScrollUpTopOverlayWidget,
            tabBodyProviderBuilder: tabBodyProviderBuilder,
            tabBodyContentBuilder: tabBodyContentBuilder,
            tabBodyOverlayBuilder: tabBodyOverlayBuilder,
            tabBarViewContainerBuilder: tabBarViewContainerBuilder,
            tabsEmptyBuilder: tabsEmptyBuilder,
          );
        },
      ),
    );
  }
}

class _NestedBodyWidget extends StatefulWidget {
  final String tabKeyPrefix;
  final Widget? onLongScrollUpTopOverlayWidget;
  final TabBodyProviderBuilder tabBodyProviderBuilder;
  final TabBodyContentBuilder tabBodyContentBuilder;
  final TabBodyOverlayBuilder tabBodyOverlayBuilder;
  final TabBarViewContainerBuilder? tabBarViewContainerBuilder;
  final TabsEmptyBuilder? tabsEmptyBuilder;

  const _NestedBodyWidget({
    required this.tabKeyPrefix,
    required this.onLongScrollUpTopOverlayWidget,
    required this.tabBodyProviderBuilder,
    required this.tabBodyContentBuilder,
    required this.tabBodyOverlayBuilder,
    required this.tabBarViewContainerBuilder,
    required this.tabsEmptyBuilder,
  });

  @override
  _NestedBodyWidgetState createState() => _NestedBodyWidgetState();
}

class _NestedBodyWidgetState extends State<_NestedBodyWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // AutomaticKeepAliveClientMixin required
    // ignore: avoid-ignoring-return-values
    super.build(context);

    return Column(
      children: [
        if (widget.onLongScrollUpTopOverlayWidget != null)
          FediNestedScrollViewWidget.buildOnLongScrollUpTopOverlayWidget(
            context,
            widget.onLongScrollUpTopOverlayWidget,
          ),
        // ignore: avoid-returning-widgets
        _buildTabBarView(context),
      ],
    );
  }

  Widget _buildTabBarView(BuildContext context) {
    var fediNestedScrollViewWithNestedScrollableTabsBloc =
        IFediNestedScrollViewWithNestedScrollableTabsBloc.of(
      context,
    );

    var tabController =
        fediNestedScrollViewWithNestedScrollableTabsBloc.tabController;

    _logger.finest(
      () => '_buildTabBarView tabController ${tabController.hashCode}',
    );

    if (tabController.length == 0) {
      var tabsEmptyBuilder = widget.tabsEmptyBuilder;
      if (tabsEmptyBuilder != null) {
        return Expanded(child: tabsEmptyBuilder(context));
      } else {
        return const Expanded(child: FediCircularProgressIndicator());
      }
    }

    Widget child = TabBarView(
      controller: tabController,
      children: List<Widget>.generate(
        tabController.length,
        (int index) => _NestedBodyTabItemWidget(
          tabKey: _calculateTabKey(widget.tabKeyPrefix, index),
          tabBodyProviderBuilder: widget.tabBodyProviderBuilder,
          tabBodyContentBuilder: widget.tabBodyContentBuilder,
          tabBodyOverlayBuilder: widget.tabBodyOverlayBuilder,
          index: index,
        ),
      ),
    );

    if (widget.tabBarViewContainerBuilder != null) {
      child = widget.tabBarViewContainerBuilder!(context, child);
    }

    return Expanded(
      child: child,
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _NestedBodyTabItemWidget extends StatefulWidget {
  final TabBodyProviderBuilder tabBodyProviderBuilder;
  final TabBodyContentBuilder tabBodyContentBuilder;
  final TabBodyOverlayBuilder? tabBodyOverlayBuilder;
  final Key tabKey;
  final int index;

  const _NestedBodyTabItemWidget({
    required this.tabKey,
    required this.index,
    required this.tabBodyProviderBuilder,
    required this.tabBodyContentBuilder,
    required this.tabBodyOverlayBuilder,
  });

  @override
  _NestedBodyTabItemWidgetState createState() =>
      _NestedBodyTabItemWidgetState();
}

class _NestedBodyTabItemWidgetState extends State<_NestedBodyTabItemWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    // AutomaticKeepAliveClientMixin required
    // ignore: avoid-ignoring-return-values
    super.build(context);

    return widget.tabBodyProviderBuilder(
      context,
      widget.index,
      Builder(
        builder: (context) => Stack(
          children: [
            NestedScrollViewInnerScrollPositionKeyWidget(
              widget.tabKey,
              widget.tabBodyContentBuilder(context, widget.index),
            ),
            if (widget.tabBodyOverlayBuilder != null)
              FediNestedScrollViewWidget.buildOverlay(
                context,
                (context) =>
                    widget.tabBodyOverlayBuilder!(context, widget.index),
              ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

Key _calculateTabKey(String tabKeyPrefix, int index) => Key(
      '$tabKeyPrefix'
      '.$index',
    );
