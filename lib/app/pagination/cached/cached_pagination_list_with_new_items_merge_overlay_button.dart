import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/ui/scroll/scroll_controller_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("pagination_list_with_new_items_header_widget.dart");

class CachedPaginationListWithNewItemsMergeOverlayButton
    extends StatelessWidget {
  final String Function(BuildContext context, int updateItemsCount) textBuilder;

  CachedPaginationListWithNewItemsMergeOverlayButton({
    @required this.textBuilder,
  });

  @override
  Widget build(BuildContext context) {
    var paginationWithUpdatesListBloc =
        ICachedPaginationListWithNewItemsBloc.of(context);

    return StreamBuilder<int>(
        stream: paginationWithUpdatesListBloc.unmergedNewItemsCountStream
            .distinct(),
        initialData: paginationWithUpdatesListBloc.unmergedNewItemsCount,
        builder: (context, snapshot) {
          var updateItemsCount = snapshot.data ?? 0;

          _logger.finest(() => "updateItemsCount $updateItemsCount");

          if (updateItemsCount > 0) {
            var scrollControllerBloc =
                IScrollControllerBloc.of(context, listen: false);

            return StreamBuilder<bool>(
                stream: Rx.combineLatest2(
                    scrollControllerBloc.scrollDirectionStream.distinct(),
                    scrollControllerBloc.scrolledToTopStream,
                    (scrollDirection, scrolledToTop) =>
                        isNeedShowMergeItems(scrollDirection, scrolledToTop)),
                initialData: isNeedShowMergeItems(
                    scrollControllerBloc.scrollDirection,
                    scrollControllerBloc.scrolledToTop),
                builder: (context, snapshot) {
                  var isNeedShowMergeItems = snapshot.data;

                  _logger.finest(
                      () => "isNeedShowMergeItems $isNeedShowMergeItems");

                  if (isNeedShowMergeItems) {
                    return buildMergeNewItemsButton(
                        context: context,
                        paginationWithUpdatesListBloc:
                            paginationWithUpdatesListBloc,
                        updateItemsCount: updateItemsCount);
                  } else {
                    return SizedBox.shrink();
                  }
                });
          } else {
            return SizedBox.shrink();
          }
        });
  }

  bool isNeedShowMergeItems(
          ScrollDirection scrollDirection, bool scrolledToTop) =>
      scrollDirection == ScrollDirection.forward ||
      scrollDirection == null ||
      scrolledToTop;

  Widget buildMergeNewItemsButton(
      {@required
          BuildContext context,
      @required
          ICachedPaginationListWithNewItemsBloc paginationWithUpdatesListBloc,
      @required
          int updateItemsCount}) {
    return FediPrimaryFilledTextButton(
      textBuilder(context, updateItemsCount),
      onPressed: () {
        paginationWithUpdatesListBloc.mergeNewItems();

        var scrollControllerBloc =
            IScrollControllerBloc.of(context, listen: false);
        scrollControllerBloc.scrollToTop();
      },
      height: FediSizes.smallFilledButtonHeight,
      expanded: false,
    );
  }
}
