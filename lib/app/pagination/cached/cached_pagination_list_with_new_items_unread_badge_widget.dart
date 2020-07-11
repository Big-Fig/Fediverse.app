import 'package:fedi/app/ui/badge/fedi_unread_badge_widget.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:flutter/cupertino.dart';

class CachedPaginationListWithNewItemsUnreadBadgeWidget
    extends FediUnreadBadgeWidget {
  const CachedPaginationListWithNewItemsUnreadBadgeWidget({
    @required Widget child,
  }) : super(
          child: child,
          offset: FediSizes.smallPadding,
        );

  @override
  Stream<bool> retrieveUnreadBadgeCountStream(BuildContext context) {
    var paginationListWithNewItemsBloc =
        ICachedPaginationListWithNewItemsBloc.of(context, listen: false);

    return paginationListWithNewItemsBloc.unmergedNewItemsCountStream
        .map((count) => count != null && count > 0);
  }
}
