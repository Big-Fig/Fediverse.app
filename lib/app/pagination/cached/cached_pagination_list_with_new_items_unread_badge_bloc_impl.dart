import 'package:fedi/app/ui/badge/bool/fedi_bool_badge_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:flutter/cupertino.dart';

class CachedPaginationListWithNewItemsUnreadBadgeBloc extends DisposableOwner
    implements IFediBoolBadgeBloc {
  final ICachedPaginationListWithNewItemsBloc
      cachedPaginationListWithNewItemsBloc;

  CachedPaginationListWithNewItemsUnreadBadgeBloc({
    @required this.cachedPaginationListWithNewItemsBloc,
  });

  @override
  Stream<bool> get badgeStream =>
      cachedPaginationListWithNewItemsBloc.unmergedNewItemsCountStream
          .map((count) => count != null && count > 0);
}