import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_widget.dart';
import 'package:fedi/refactored/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:flutter/cupertino.dart';

class PaginationListWithNewItemsContainerWidget extends StatelessWidget {
  final PaginationListWidget child;

  PaginationListWithNewItemsContainerWidget({@required this.child});

  @override
  Widget build(BuildContext context) {
    var paginationWithUpdatesListBloc =
        IPaginationListWithNewItemsBloc.of(context);

    return Stack(
      children: <Widget>[
        StreamBuilder<int>(
            stream: paginationWithUpdatesListBloc.unmergedNewItemsCountStream,
            initialData: paginationWithUpdatesListBloc.unmergedNewItemsCount,
            builder: (context, snapshot) {
              var updateItemsCount = snapshot.data ?? 0;

              if (updateItemsCount > 0) {
                return GestureDetector(
                    onTap: () {
                      paginationWithUpdatesListBloc.mergeNewItems();
                    },
                    child: Text(AppLocalizations.of(context).tr(
                        "pagination.list.new_items.action.tap_to_load_new",
                        args: [updateItemsCount.toString()])));
              } else {
                return SizedBox.shrink();
              }
            }),
        child,
      ],
    );
  }
}
