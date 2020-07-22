import 'package:fedi/app/chat/chat_model.dart';
import 'package:fedi/app/chat/list/cached/chat_cached_list_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class ChatPaginationListWithNewItemsBloc<
        TPage extends CachedPaginationPage<IChat>>
    extends CachedPaginationListWithNewItemsBloc<TPage, IChat> {
  final IChatCachedBloc cachedListService;

  ChatPaginationListWithNewItemsBloc(
      {@required bool mergeNewItemsImmediately,
      @required this.cachedListService,
      @required ICachedPaginationBloc<TPage, IChat> paginationBloc})
      : super(
            mergeNewItemsImmediately: mergeNewItemsImmediately,
            paginationBloc: paginationBloc);

  @override
  Stream<List<IChat>> watchItemsNewerThanItem(IChat item) =>
      cachedListService.watchLocalItemsNewerThanItem(item);

  @override
  int compareItemsToSort(IChat a, IChat b) {
    if (a?.updatedAt == null && b?.updatedAt == null) {
      return 0;
    }

    if (a?.updatedAt != null && b?.updatedAt == null) {
      return 1;
    }
    if (a?.updatedAt == null && b?.updatedAt != null) {
      return -1;
    }
    return a.updatedAt.compareTo(b.updatedAt);
  }

  @override
  bool isItemsEqual(IChat a, IChat b) => a.remoteId == b.remoteId;
}
