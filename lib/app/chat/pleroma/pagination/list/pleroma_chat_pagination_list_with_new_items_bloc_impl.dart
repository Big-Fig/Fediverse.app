import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/list/cached/pleroma_chat_cached_list_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class PleromaChatPaginationListWithNewItemsBloc<
        TPage extends CachedPaginationPage<IPleromaChat>>
    extends CachedPaginationListWithNewItemsBloc<TPage, IPleromaChat> {
  final IPleromaChatCachedListBloc cachedListBloc;

  PleromaChatPaginationListWithNewItemsBloc(
      {@required bool mergeNewItemsImmediately,
      @required this.cachedListBloc,
      @required ICachedPaginationBloc<TPage, IPleromaChat> paginationBloc})
      : super(
            mergeNewItemsImmediately: mergeNewItemsImmediately,
            paginationBloc: paginationBloc);

  @override
  Stream<List<IPleromaChat>> watchItemsNewerThanItem(IPleromaChat item) =>
      cachedListBloc.watchLocalItemsNewerThanItem(item);

  @override
  int compareItemsToSort(IPleromaChat a, IPleromaChat b) {
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
  bool isItemsEqual(IPleromaChat a, IPleromaChat b) => a.remoteId == b.remoteId;
}
