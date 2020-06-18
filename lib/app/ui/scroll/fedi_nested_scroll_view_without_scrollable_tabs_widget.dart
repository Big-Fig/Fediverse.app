import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_bloc.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_widget.dart';
import 'package:flutter/cupertino.dart';

typedef ProviderBuilder = Widget Function(BuildContext context, Widget child);

class FediNestedScrollViewWithoutNestedScrollableTabsWidget
    extends FediNestedScrollViewWidget {
  final ProviderBuilder providerBuilder;
  final NestedScrollViewContentBuilder contentBuilder;
  final NestedScrollViewOverlayBuilder overlayBuilder;

  FediNestedScrollViewWithoutNestedScrollableTabsWidget({
    @required Widget onLongScrollUpTopOverlayWidget,
    @required List<Widget> topSliverWidgets,
    @required double topSliverScrollOffsetToShowWhiteStatusBar,
    @required this.providerBuilder,
    @required this.contentBuilder,
    @required this.overlayBuilder,
  }) : super(
          onLongScrollUpTopOverlayWidget: onLongScrollUpTopOverlayWidget,
          topSliverWidgets: topSliverWidgets,
          topSliverScrollOffsetToShowWhiteStatusBar:
              topSliverScrollOffsetToShowWhiteStatusBar,
        );

  @override
  Widget buildNestedScrollView(BuildContext context) {
    IFediNestedScrollViewBloc fediNestedScrollViewBloc =
        IFediNestedScrollViewBloc.of(context, listen: false);
    var nestedScrollController =
        fediNestedScrollViewBloc.nestedScrollController;
    return NestedScrollView(
      // we use custom nested scroll controller to achieve scroll callbacks
      // from body scrollables
      controller: nestedScrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
          buildTopSliverWidgets(context),
      body: Builder(
        builder: (context) {
          // required by extended_nested_scroll_view
          nestedScrollController.enableScroll(context);

          return Column(
            children: [
              if (onLongScrollUpTopOverlayWidget != null)
                FediNestedScrollViewWidget.buildOnLongScrollUpTopOverlayWidget(
                    context, onLongScrollUpTopOverlayWidget),
              Expanded(child: _buildBody(context))
            ],
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) => providerBuilder(
        context,
        Builder(
          builder: (context) {
            return Stack(
              children: [
                Expanded(
                  child: contentBuilder(context),
                ),
                if (overlayBuilder != null)
                  FediNestedScrollViewWidget.buildOverlay(
                      context, overlayBuilder),
              ],
            );
          },
        ),
      );
}
