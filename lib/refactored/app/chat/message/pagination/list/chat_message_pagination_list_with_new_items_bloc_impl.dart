import 'package:fedi/refactored/app/chat/message/chat_message_model.dart';
import 'package:fedi/refactored/app/chat/message/list/cached/chat_message_cached_list_bloc.dart';
import 'package:fedi/refactored/pagination/list/with_new_items/pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/refactored/pagination/pagination_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("chatMessage_pagination_list_with_new_items_bloc_impl.dart");

class ChatMessagePaginationListWithNewItemsBloc<
        TPage extends PaginationPage<IChatMessage>>
    extends PaginationListWithNewItemsBloc<TPage, IChatMessage> {
  final IChatMessageCachedListBloc chatMessageCachedListService;

  ChatMessagePaginationListWithNewItemsBloc(
      {@required bool mergeNewItemsImmediately,
      @required this.chatMessageCachedListService,
      @required IPaginationBloc<TPage, IChatMessage> paginationBloc})
      : super(
            mergeNewItemsImmediately: mergeNewItemsImmediately,
            paginationBloc: paginationBloc);

  @override
  Stream<List<IChatMessage>> watchItemsNewerThanItem(IChatMessage item) {
    _logger.finest(() => "watchItemsNewerThanItem item = $item");
    return chatMessageCachedListService.watchLocalItemsNewerThanItem(item);
  }

  @override
  int compareItems(IChatMessage a, IChatMessage b) {
    if (a?.createdAt == null && b?.createdAt == null) {
      return 0;
    }

    if (a?.createdAt != null && b?.createdAt == null) {
      return -1;
    }
    if (a?.createdAt == null && b?.createdAt != null) {
      return 1;
    }
    return a.createdAt.compareTo(b.createdAt);
  }
}
