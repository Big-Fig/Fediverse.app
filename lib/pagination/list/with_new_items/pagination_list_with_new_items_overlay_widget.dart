import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/ui/scroll/scroll_controller_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:logging/logging.dart';

var _logger = Logger("pagination_list_with_new_items_header_widget.dart");

class PaginationListWithNewItemsOverlayWidget extends StatelessWidget {
  final String Function(BuildContext context, int updateItemsCount) textBuilder;

  PaginationListWithNewItemsOverlayWidget({
    @required this.textBuilder,
  });

  @override
  Widget build(BuildContext context) {
    var paginationWithUpdatesListBloc =
        IPaginationListWithNewItemsBloc.of(context);

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

            return StreamBuilder<ScrollDirection>(
                stream: scrollControllerBloc.scrollDirectionStream.distinct(),
                initialData: scrollControllerBloc.scrollDirection,
                builder: (context, snapshot) {
                  var scrollDirection = snapshot.data;

                  _logger.finest(() => "scrollDirection $scrollDirection");

                  if (scrollDirection ==
                          ScrollDirection
                              .forward || //                        scrollDirection == ScrollDirection.idle ||
                      scrollDirection == null) {
                    return _buildButton(paginationWithUpdatesListBloc, context,
                        updateItemsCount);
                  } else {
                    return SizedBox.shrink();
                  }
                });
          } else {
            return SizedBox.shrink();
          }
        });
  }

  Widget _buildButton(
      IPaginationListWithNewItemsBloc<PaginationPage, dynamic>
          paginationWithUpdatesListBloc,
      BuildContext context,
      int updateItemsCount) {
    return FediPrimaryFilledTextButton(
      textBuilder(context, updateItemsCount),
      onPressed: () {
        paginationWithUpdatesListBloc.mergeNewItems();

        var scrollControllerBloc =
            IScrollControllerBloc.of(context, listen: false);
        scrollControllerBloc.scrollToTop();
      },
      height: FediSizes.smallFilledButtonHeight,
    );
  }
}
