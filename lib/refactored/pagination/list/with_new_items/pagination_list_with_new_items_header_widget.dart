import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("pagination_list_with_new_items_header_widget.dart");

class PaginationListWithNewItemsHeaderWidget extends StatelessWidget {
  final Widget child;

  const PaginationListWithNewItemsHeaderWidget({@required this.child});

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
              padding: const EdgeInsets.all(8.0),
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
                    decoration: BoxDecoration(color: Colors.blue),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        AppLocalizations.of(context).tr(
                            "pagination.list.new_items.action.tap_to_load_new",
                            args: [updateItemsCount.toString()]),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ));
            } else {
              return SizedBox.shrink();
            }
          });
}
