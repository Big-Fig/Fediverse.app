import 'package:fedi_app/app/ui/scroll/fedi_nested_scroll_view_bloc.dart';
import 'package:fedi_app/app/ui/scroll/fedi_nested_scroll_view_widget.dart';
import 'package:flutter/cupertino.dart';

typedef ProviderBuilder = Widget Function(BuildContext context, Widget child);

class FediNestedScrollViewWithoutNestedScrollableTabsWidget
    extends FediNestedScrollViewWidget {
  final ProviderBuilder providerBuilder;
  final NestedScrollViewContentBuilder contentBuilder;
  final NestedScrollViewOverlayBuilder? overlayBuilder;

  const FediNestedScrollViewWithoutNestedScrollableTabsWidget({
    Key? key,
    required Widget? onLongScrollUpTopOverlayWidget,
    required List<Widget> topSliverWidgets,
    required double? topSliverScrollOffsetToShowWhiteStatusBar,
    required this.providerBuilder,
    required this.contentBuilder,
    required this.overlayBuilder,
  }) : super(
          key: key,
          onLongScrollUpTopOverlayWidget: onLongScrollUpTopOverlayWidget,
          topSliverWidgets: topSliverWidgets,
          topSliverScrollOffsetToShowWhiteStatusBar:
              topSliverScrollOffsetToShowWhiteStatusBar,
        );

  @override
  Widget buildNestedScrollView(BuildContext context) {
    var fediNestedScrollViewBloc =
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
          nestedScrollController!.enableScroll(context);

          return Column(
            children: [
              if (onLongScrollUpTopOverlayWidget != null)
                FediNestedScrollViewWidget.buildOnLongScrollUpTopOverlayWidget(
                  context,
                  onLongScrollUpTopOverlayWidget,
                ),
              Expanded(
                child: providerBuilder(
                  context,
                  Builder(
                    builder: (context) => Stack(
                      children: [
                        Positioned(
                          top: 0.0,
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: contentBuilder(context),
                        ),
                        if (overlayBuilder != null)
                          FediNestedScrollViewWidget.buildOverlay(
                            context,
                            overlayBuilder!,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
