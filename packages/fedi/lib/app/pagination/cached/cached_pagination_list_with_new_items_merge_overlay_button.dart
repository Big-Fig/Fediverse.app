import 'package:fedi/app/ui/button/text/with_border/fedi_primary_filled_text_button_with_border.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/ui/scroll/scroll_controller_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger('pagination_list_with_new_items_header_widget.dart');

class CachedPaginationListWithNewItemsMergeOverlayButton
    extends StatelessWidget {
  final String Function(BuildContext context, int updateItemsCount) textBuilder;

  const CachedPaginationListWithNewItemsMergeOverlayButton({
    Key? key,
    required this.textBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var paginationWithUpdatesListBloc =
        ICachedPaginationListWithNewItemsBloc.of(context);

    return StreamBuilder<int>(
      stream:
          paginationWithUpdatesListBloc.unmergedNewItemsCountStream.distinct(),
      initialData: paginationWithUpdatesListBloc.unmergedNewItemsCount,
      builder: (context, snapshot) {
        var updateItemsCount = snapshot.data ?? 0;

        _logger.finest(() => 'updateItemsCount $updateItemsCount');

        var scrollControllerBloc =
            IScrollControllerBloc.of(context, listen: false);

        return StreamBuilder<bool>(
          stream: Rx.combineLatest2(
            scrollControllerBloc.scrollDirectionStream.distinct(),
            scrollControllerBloc.scrolledToTopStream,
            (ScrollDirection? scrollDirection, bool scrolledToTop) =>
                isNeedShowMergeItems(
              scrollDirection: scrollDirection,
              scrolledToTop: scrolledToTop,
            ),
          ),
          initialData: isNeedShowMergeItems(
            scrollDirection: scrollControllerBloc.scrollDirection,
            scrolledToTop: scrollControllerBloc.scrolledToTop,
          ),
          builder: (context, snapshot) {
            var isNeedShowMergeItems = snapshot.data!;

            _logger.finest(() => 'isNeedShowMergeItems $isNeedShowMergeItems');

            Widget child;

            if (isNeedShowMergeItems && updateItemsCount > 0) {
              child = FediPrimaryFilledTextButtonWithBorder(
                textBuilder(context, updateItemsCount),
                onPressed: () {
                  paginationWithUpdatesListBloc.mergeNewItems();

                  var scrollControllerBloc =
                      IScrollControllerBloc.of(context, listen: false);
                  // ignore: cascade_invocations
                  scrollControllerBloc.scrollToTop();
                },
                height: FediSizes.smallFilledButtonHeight,
                expanded: false,
              );
            } else {
              child = const SizedBox.shrink();
            }

            return AnimatedSwitcher(
              // todo: refactor magic number
              // ignore: no-magic-number
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
              child: child,
            );
          },
        );
      },
    );
  }

  bool isNeedShowMergeItems({
    required ScrollDirection? scrollDirection,
    required bool scrolledToTop,
  }) =>
      scrollDirection == ScrollDirection.forward ||
      scrollDirection == null ||
      scrolledToTop;
}
