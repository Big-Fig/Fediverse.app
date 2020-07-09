import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/chat/message/list/cached/chat_message_cached_list_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger =
    Logger("chatMessage_pagination_list_with_new_items_bloc_impl.dart");

class ChatMessageCachedPaginationListWithNewItemsBloc<
        TPage extends CachedPaginationPage<IChatMessage>>
    extends CachedPaginationListWithNewItemsBloc<TPage, IChatMessage> {
  final IChatMessageCachedListBloc chatMessageCachedListService;

  ChatMessageCachedPaginationListWithNewItemsBloc(
      {@required
          bool mergeNewItemsImmediately,
      @required
          this.chatMessageCachedListService,
      @required
          ICachedPaginationBloc<TPage, IChatMessage> cachedPaginationBloc})
      : super(
            mergeNewItemsImmediately: mergeNewItemsImmediately,
            paginationBloc: cachedPaginationBloc);

  @override
  Stream<List<IChatMessage>> watchItemsNewerThanItem(IChatMessage item) {
    _logger.finest(() => "watchItemsNewerThanItem item = $item");
    return chatMessageCachedListService.watchLocalItemsNewerThanItem(item);
  }

  @override
  int compareItemsToSort(IChatMessage a, IChatMessage b) {
    if (a?.createdAt == null && b?.createdAt == null) {
      return 0;
    }

    if (a?.createdAt != null && b?.createdAt == null) {
      return 1;
    }
    if (a?.createdAt == null && b?.createdAt != null) {
      return -1;
    }
    return a.createdAt.compareTo(b.createdAt);
  }

  @override
  bool isItemsEqual(IChatMessage a, IChatMessage b) => a.remoteId == b.remoteId;

  static ChatMessageCachedPaginationListWithNewItemsBloc createFromContext(
      {@required BuildContext context,
      @required bool mergeNewItemsImmediately}) {
    return ChatMessageCachedPaginationListWithNewItemsBloc(
      mergeNewItemsImmediately: true,
      chatMessageCachedListService:
          IChatMessageCachedListBloc.of(context, listen: false),
      cachedPaginationBloc: Provider.of<
          IPaginationBloc<CachedPaginationPage<IChatMessage>,
              IChatMessage>>(context, listen: false),
    );
  }
}
