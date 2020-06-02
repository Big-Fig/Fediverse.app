import 'package:fedi/app/ui/badge/fedi_unread_badge_widget.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:flutter/cupertino.dart';

class PaginationListWithNewItemsUnreadBadgeWidget
    extends FediUnreadBadgeWidget {
  const PaginationListWithNewItemsUnreadBadgeWidget({
    @required Widget child,
  }) : super(
          child: child,
          offset: 8.0,
        );

  @override
  Stream<bool> retrieveUnreadBadgeCountStream(BuildContext context) {
    var paginationListWithNewItemsBloc =
        IPaginationListWithNewItemsBloc.of(context, listen: false);

    return paginationListWithNewItemsBloc.unmergedNewItemsCountStream
        .map((count) => count != null && count > 0);
  }
}
