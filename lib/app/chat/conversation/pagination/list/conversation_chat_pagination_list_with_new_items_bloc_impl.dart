import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/list/cached/conversation_chat_cached_list_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:flutter/widgets.dart';

class ConversationChatPaginationListWithNewItemsBloc<
        TPage extends CachedPaginationPage<IConversationChat>>
    extends CachedPaginationListWithNewItemsBloc<TPage, IConversationChat> {
  final IConversationChatCachedListBloc cachedListService;

  ConversationChatPaginationListWithNewItemsBloc(
      {@required bool mergeNewItemsImmediately,
      @required this.cachedListService,
      @required IPaginationBloc<TPage, IConversationChat> paginationBloc})
      : super(
            mergeNewItemsImmediately: mergeNewItemsImmediately,
            paginationBloc: paginationBloc);

  @override
  Stream<List<IConversationChat>> watchItemsNewerThanItem(IConversationChat item) =>
      cachedListService.watchLocalItemsNewerThanItem(item);

  @override
  int compareItemsToSort(IConversationChat a, IConversationChat b) {
    if (a == null && b == null) {
      return 0;
    }

    if (a != null && b == null) {
      return 1;
    }
    if (a == null && b != null) {
      return -1;
    }
    return a.remoteId.compareTo(b.remoteId);
  }

  @override
  bool isItemsEqual(IConversationChat a, IConversationChat b) =>
      a.remoteId == b.remoteId;
}
