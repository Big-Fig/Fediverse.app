import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/ui/badge/bool/fedi_bool_badge_bloc.dart';
import 'package:fedi_app/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';

class CachedPaginationListWithNewItemsUnreadBadgeBloc extends DisposableOwner
    implements IFediBoolBadgeBloc {
  final ICachedPaginationListWithNewItemsBloc
      cachedPaginationListWithNewItemsBloc;

  CachedPaginationListWithNewItemsUnreadBadgeBloc({
    required this.cachedPaginationListWithNewItemsBloc,
  });

  @override
  Stream<bool> get badgeStream =>
      cachedPaginationListWithNewItemsBloc.unmergedNewItemsCountStream
          .map((count) => count > 0);
}
