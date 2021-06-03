import 'package:fedi/app/chat/conversation/with_last_message/conversation_chat_with_last_message_model.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationChatWithLastMessagePaginationListWithNewItemsBloc<
        TPage extends CachedPaginationPage<IConversationChatWithLastMessage>>
    extends ICachedPaginationListWithNewItemsBloc<TPage,
        IConversationChatWithLastMessage> {
  static IConversationChatWithLastMessagePaginationListWithNewItemsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IConversationChatWithLastMessagePaginationListWithNewItemsBloc>(
        context,
        listen: listen,
      );
}
