import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("pagination_list_with_new_items_header_widget.dart");

class PaginationListWithNewItemsHeaderWidget extends StatelessWidget {
  final String Function(BuildContext context, int updateItemsCount) textBuilder;
  final Widget child;

  PaginationListWithNewItemsHeaderWidget({
    @required this.child,
    @required this.textBuilder,
  });

  @override
  Widget build(BuildContext context) {
    var paginationWithUpdatesListBloc =
        IPaginationListWithNewItemsBloc.of(context);

    return Stack(
      children: <Widget>[
        child,
        Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: buildNewItemsHeaderWidget(paginationWithUpdatesListBloc),
            )),
      ],
    );
  }

  StreamBuilder<int> buildNewItemsHeaderWidget(
          IPaginationListWithNewItemsBloc<PaginationPage, dynamic>
              paginationWithUpdatesListBloc) =>
      StreamBuilder<int>(
          stream: paginationWithUpdatesListBloc.unmergedNewItemsCountStream
              .distinct(),
          initialData: paginationWithUpdatesListBloc.unmergedNewItemsCount,
          builder: (context, snapshot) {
            var updateItemsCount = snapshot.data ?? 0;

            _logger.finest(() => "updateItemsCount $updateItemsCount");

            if (updateItemsCount > 0) {
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
            } else {
              return SizedBox.shrink();
            }
          });
}
