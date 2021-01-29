import 'package:fedi/app/chat/chat_body_wrapper_widget.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_bloc.dart';
import 'package:fedi/app/chat/conversation/message/conversation_chat_message_bloc.dart';
import 'package:fedi/app/chat/conversation/message/conversation_chat_message_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/message/conversation_chat_message_model.dart';
import 'package:fedi/app/chat/conversation/message/list/cached/conversation_chat_message_cached_list_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/message/pagination/cached/conversation_chat_message_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/message/pagination/cached/conversation_chat_message_cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/chat/message/chat_message_bloc.dart';
import 'package:fedi/app/chat/message/list/chat_message_list_item_widget.dart';
import 'package:fedi/app/chat/message/list/chat_message_list_widget.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ConversationChatWidget extends StatelessWidget {
  const ConversationChatWidget();

  @override
  Widget build(BuildContext context) {
    var chatBloc = IConversationChatBloc.of(context, listen: true);
    return FediAsyncInitLoadingWidget(
      asyncInitLoadingBloc: chatBloc,
      loadingFinishedBuilder: (context) {
        return ConversationChatMessageCachedListBloc.provideToContext(
          context,
          conversation: chatBloc.chat,
          lastMessage: chatBloc.lastChatMessage,
          child: ConversationChatMessageCachedPaginationBloc.provideToContext(
            context,
            child: ConversationChatMessageCachedPaginationListWithNewItemsBloc
                .provideToContext(
              context,
              mergeNewItemsImmediately: true,
              child: const ChatBodyWrapperWidget(
                child: ChatMessageListWidget<IConversationChatMessage>(
                  itemBuilder: _itemBuilder,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget _itemBuilder(BuildContext context) {
  return DisposableProxyProvider<IConversationChatMessage,
      IConversationChatMessageBloc>(
    update: (context, chatMessage, _) =>
        ConversationChatMessageBloc.createFromContext(
      context,
      chatMessage,
    ),
    child: ProxyProvider<IConversationChatMessageBloc, IChatMessageBloc>(
      update: (context, value, _) => value,
      child: const ChatMessageListItemWidget<IConversationChatMessage>(),
    ),
  );
}
