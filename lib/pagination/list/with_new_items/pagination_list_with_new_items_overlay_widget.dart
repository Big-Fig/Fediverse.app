import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/ui/scroll_direction_detector_bloc.dart';
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

//    return StreamBuilder<bool>(
//        stream: paginationWithUpdatesListBloc.isDismissedStream,
//        initialData: paginationWithUpdatesListBloc.isDismissed,
//        builder: (context, snapshot) {
//          var isDismissed = snapshot.data;
//
//          if (isDismissed) {
//            return SizedBox.shrink();
//          } else {
    return StreamBuilder<int>(
        stream: paginationWithUpdatesListBloc.unmergedNewItemsCountStream
            .distinct(),
        initialData: paginationWithUpdatesListBloc.unmergedNewItemsCount,
        builder: (context, snapshot) {
          var updateItemsCount = snapshot.data ?? 0;

          _logger.finest(() => "updateItemsCount $updateItemsCount");

          if (updateItemsCount > 0) {
            try {
              var scrollDirectionDetector =
              IScrollDirectionDetector.of(context, listen: false);

              return StreamBuilder<ScrollDirection>(
                  stream:
                  scrollDirectionDetector.scrollDirectionStream.distinct(),
                  initialData: scrollDirectionDetector.scrollDirection,
                  builder: (context, snapshot) {
                    var scrollDirection = snapshot.data;

                    if (scrollDirection != ScrollDirection.reverse) {
                      return _buildButtons(paginationWithUpdatesListBloc, context, updateItemsCount);
                    } else {
                      return SizedBox.shrink();
                    }
                  });
            } catch(e) {
              return _buildButtons(paginationWithUpdatesListBloc, context, updateItemsCount);
            }

          } else {
            return SizedBox.shrink();
          }
        });
//          }
//        });
  }

  GestureDetector _buildButtons(IPaginationListWithNewItemsBloc<PaginationPage, dynamic> paginationWithUpdatesListBloc, BuildContext context, int updateItemsCount) {
    return GestureDetector(
                        onTap: () {
                          paginationWithUpdatesListBloc.mergeNewItems();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: FediColors.primaryColor,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 40.0),
                            child: Text(
                              textBuilder(context, updateItemsCount),
                              style: TextStyle(
                                color: FediColors.white,
                                fontWeight: FontWeight.w500,
                                height: 1.15,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ));
  }
}
