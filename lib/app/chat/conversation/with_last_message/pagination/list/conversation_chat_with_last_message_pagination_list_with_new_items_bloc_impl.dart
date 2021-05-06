import 'package:fedi/app/chat/conversation/with_last_message/conversation_chat_with_last_message_model.dart';
import 'package:fedi/app/chat/conversation/with_last_message/list/cached/conversation_chat_with_last_message_cached_list_bloc.dart';
import 'package:fedi/app/chat/conversation/with_last_message/pagination/list/conversation_chat_with_last_message_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_impl.dart';

class ConversationChatWithLastMessagePaginationListWithNewItemsBloc<
        TPage extends CachedPaginationPage<IConversationChatWithLastMessage>>
    extends CachedPaginationListWithNewItemsBloc<TPage,
        IConversationChatWithLastMessage>
    implements
        IConversationChatWithLastMessagePaginationListWithNewItemsBloc<TPage> {
  final IConversationChatWithLastMessageCachedListBloc cachedListBloc;

  ConversationChatWithLastMessagePaginationListWithNewItemsBloc({
    required bool mergeNewItemsImmediately,
    required this.cachedListBloc,
    required ICachedPaginationBloc<TPage, IConversationChatWithLastMessage>
        paginationBloc,
  }) : super(
          mergeNewItemsImmediately: mergeNewItemsImmediately,
          paginationBloc: paginationBloc,
        );

  @override
  Stream<List<IConversationChatWithLastMessage>> watchItemsNewerThanItem(
    IConversationChatWithLastMessage? item,
  ) =>
      cachedListBloc.watchLocalItemsNewerThanItem(item);
}
