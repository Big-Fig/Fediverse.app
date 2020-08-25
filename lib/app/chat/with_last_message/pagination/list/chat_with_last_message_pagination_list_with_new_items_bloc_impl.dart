import 'package:fedi/app/chat/with_last_message/chat_with_last_message_model.dart';
import 'package:fedi/app/chat/with_last_message/list/cached/chat_with_last_message_cached_list_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class ChatWithLastMessagePaginationListWithNewItemsBloc<
        TPage extends CachedPaginationPage<IChatWithLastMessage>>
    extends CachedPaginationListWithNewItemsBloc<TPage, IChatWithLastMessage> {
  final IChatWithLastMessageCachedBloc cachedListBloc;

  ChatWithLastMessagePaginationListWithNewItemsBloc(
      {@required
          bool mergeNewItemsImmediately,
      @required
          this.cachedListBloc,
      @required
          ICachedPaginationBloc<TPage, IChatWithLastMessage> paginationBloc})
      : super(
            mergeNewItemsImmediately: mergeNewItemsImmediately,
            paginationBloc: paginationBloc);

  @override
  Stream<List<IChatWithLastMessage>> watchItemsNewerThanItem(
          IChatWithLastMessage item) =>
      cachedListBloc.watchLocalItemsNewerThanItem(item);

  @override
  int compareItemsToSort(IChatWithLastMessage a, IChatWithLastMessage b) {
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
  bool isItemsEqual(IChatWithLastMessage a, IChatWithLastMessage b) =>
      a.chat.remoteId == b.chat.remoteId;
}
