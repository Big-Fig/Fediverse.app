import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart'
    as extended_nested_scroll_view;
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_bloc.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_widget.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' hide NestedScrollView;
import 'package:logging/logging.dart';

typedef TabBodyProviderBuilder = Function(
    BuildContext context, int index, Widget child);

var _logger =
    Logger("fedi_nested_scroll_view_with_nested_scrollable_tabs_widget.dart");

class FediNestedScrollViewWithNestedScrollableTabsWidget
    extends FediNestedScrollViewWidget {
  final String tabKeyPrefix;

  final TabBodyProviderBuilder tabBodyProviderBuilder;
  final NestedScrollViewContentBuilder tabBodyContentBuilder;
  final NestedScrollViewOverlayBuilder tabBodyOverlayBuilder;

  FediNestedScrollViewWithNestedScrollableTabsWidget({
    @required Widget onLongScrollUpTopOverlayWidget,
    @required List<Widget> topSliverWidgets,
    @required double topSliverScrollOffsetToShowWhiteStatusBar,
    @required this.tabKeyPrefix,
    @required this.tabBodyProviderBuilder,
    @required this.tabBodyContentBuilder,
    @required this.tabBodyOverlayBuilder,
  }) : super(
          onLongScrollUpTopOverlayWidget: onLongScrollUpTopOverlayWidget,
          topSliverWidgets: topSliverWidgets,
          topSliverScrollOffsetToShowWhiteStatusBar:
              topSliverScrollOffsetToShowWhiteStatusBar,
        );

  Key _innerScrollPositionKeyBuilder(BuildContext context) {
    var fediNestedScrollViewWithNestedScrollableTabsBloc =
        IFediNestedScrollViewWithNestedScrollableTabsBloc.of(context,
            listen: false);

    return _calculateTabKey(
      tabKeyPrefix,
      fediNestedScrollViewWithNestedScrollableTabsBloc.tabController.index,
    );
  }

  @override
  Widget buildNestedScrollView(
    BuildContext context,
  ) {
    IFediNestedScrollViewBloc fediNestedScrollViewBloc =
        IFediNestedScrollViewBloc.of(context, listen: false);
    var nestedScrollController =
        fediNestedScrollViewBloc.nestedScrollController;
    // extended_nested_scroll_view required to fix nested scrollables sync issue
    return extended_nested_scroll_view.NestedScrollView(
      // we use custom nested scroll controller to achieve scroll callbacks
      // from body scrollables
      controller: nestedScrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
          buildTopSliverWidgets(context),
      innerScrollPositionKeyBuilder: () =>
          _innerScrollPositionKeyBuilder(context),
      body: Builder(
        builder: (context) {
          // required by extended_nested_scroll_view
          nestedScrollController.enableScroll(context);

          return _NestedBodyWidget(
            tabKeyPrefix: tabKeyPrefix,
            onLongScrollUpTopOverlayWidget: onLongScrollUpTopOverlayWidget,
            tabBodyProviderBuilder: tabBodyProviderBuilder,
            tabBodyContentBuilder: tabBodyContentBuilder,
            tabBodyOverlayBuilder: tabBodyOverlayBuilder,
          );
        },
      ),
    );
  }
}

class _NestedBodyWidget extends StatefulWidget {
  final String tabKeyPrefix;
  final Widget onLongScrollUpTopOverlayWidget;
  final TabBodyProviderBuilder tabBodyProviderBuilder;
  final NestedScrollViewContentBuilder tabBodyContentBuilder;
  final NestedScrollViewOverlayBuilder tabBodyOverlayBuilder;

  const _NestedBodyWidget({
    @required this.tabKeyPrefix,
    @required this.onLongScrollUpTopOverlayWidget,
    @required this.tabBodyProviderBuilder,
    @required this.tabBodyContentBuilder,
    @required this.tabBodyOverlayBuilder,
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
    super.build(context);

    return Column(
      children: [
        if (widget.onLongScrollUpTopOverlayWidget != null)
          FediNestedScrollViewWidget.buildOnLongScrollUpTopOverlayWidget(
            context,
            widget.onLongScrollUpTopOverlayWidget,
          ),
        _buildTabBarView(context),
      ],
    );
  }

  Widget _buildTabBarView(BuildContext context) {
    var fediNestedScrollViewWithNestedScrollableTabsBloc =
        IFediNestedScrollViewWithNestedScrollableTabsBloc.of(context,
            listen: false);

    var tabController =
        fediNestedScrollViewWithNestedScrollableTabsBloc.tabController;
    return Expanded(
      child: TabBarView(
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
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _NestedBodyTabItemWidget extends StatefulWidget {
  final TabBodyProviderBuilder tabBodyProviderBuilder;
  final NestedScrollViewContentBuilder tabBodyContentBuilder;
  final NestedScrollViewOverlayBuilder tabBodyOverlayBuilder;
  final Key tabKey;
  final int index;

  const _NestedBodyTabItemWidget({
    @required this.tabKey,
    @required this.index,
    @required this.tabBodyProviderBuilder,
    @required this.tabBodyContentBuilder,
    @required this.tabBodyOverlayBuilder,
  });

  @override
  _NestedBodyTabItemWidgetState createState() =>
      _NestedBodyTabItemWidgetState();
}

class _NestedBodyTabItemWidgetState extends State<_NestedBodyTabItemWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return widget.tabBodyProviderBuilder(
      context,
      widget.index,
      Builder(
        builder: (context) {
          return Stack(
            children: [
              widget.tabBodyContentBuilder(context),
              if (widget.tabBodyOverlayBuilder != null)
                FediNestedScrollViewWidget.buildOverlay(
                    context, widget.tabBodyOverlayBuilder),
            ],
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

Key _calculateTabKey(String tabKeyPrefix, int index) => Key("$tabKeyPrefix"
    ".$index");
