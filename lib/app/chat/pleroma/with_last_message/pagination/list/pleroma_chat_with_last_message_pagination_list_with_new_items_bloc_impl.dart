import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_model.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/list/cached/pleroma_chat_with_last_message_cached_list_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class PleromaChatWithLastMessagePaginationListWithNewItemsBloc<
        TPage extends CachedPaginationPage<IPleromaChatWithLastMessage>>
    extends CachedPaginationListWithNewItemsBloc<TPage, IPleromaChatWithLastMessage> {
  final IPleromaChatWithLastMessageCachedBloc cachedListBloc;

  PleromaChatWithLastMessagePaginationListWithNewItemsBloc(
      {@required
          bool mergeNewItemsImmediately,
      @required
          this.cachedListBloc,
      @required
          ICachedPaginationBloc<TPage, IPleromaChatWithLastMessage> paginationBloc})
      : super(
            mergeNewItemsImmediately: mergeNewItemsImmediately,
            paginationBloc: paginationBloc);

  @override
  Stream<List<IPleromaChatWithLastMessage>> watchItemsNewerThanItem(
          IPleromaChatWithLastMessage item) =>
      cachedListBloc.watchLocalItemsNewerThanItem(item);

  @override
  int compareItemsToSort(IPleromaChatWithLastMessage a, IPleromaChatWithLastMessage b) {
    if (a?.chat?.updatedAt == null && b?.chat?.updatedAt == null) {
      return 0;
    }

    if (a?.chat?.updatedAt != null && b?.chat?.updatedAt == null) {
      return 1;
    }
    if (a?.chat?.updatedAt == null && b?.chat?.updatedAt != null) {
      return -1;
    }
    return a.chat.updatedAt.compareTo(b?.chat?.updatedAt);
  }

  @override
  bool isItemsEqual(IPleromaChatWithLastMessage a, IPleromaChatWithLastMessage b) =>
      a.chat.remoteId == b.chat.remoteId;
}
