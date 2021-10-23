import 'package:easy_dispose_provider/easy_dispose_provider.dart';
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
import 'package:fedi/app/status/post/post_status_widget.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ConversationChatWidget extends StatelessWidget {
  const ConversationChatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chatBloc = IConversationChatBloc.of(context);

    return FediAsyncInitLoadingWidget(
      asyncInitLoadingBloc: chatBloc,
      loadingFinishedBuilder: (context) {
        var lastPublishedChatMessage = chatBloc.lastPublishedChatMessage;

        return ConversationChatMessageCachedListBloc.provideToContext(
          context,
          conversation: chatBloc.chat,
          lastMessage: lastPublishedChatMessage,
          child: ConversationChatMessageCachedPaginationBloc.provideToContext(
            context,
            child: ConversationChatMessageCachedPaginationListWithNewItemsBloc
                .provideToContext(
              context,
              mergeNewItemsImmediately: true,
              child: ChatBodyWrapperWidget(
                postWidget: PostStatusWidget(
                  showActionsOnlyWhenFocused: false,
                  hintText: S.of(context).app_chat_post_field_content_hint,
                ),
                child: const ChatMessageListWidget<IConversationChatMessage>(
                  itemBuilder: _itemBuilder,
                  itemContextBuilder: _itemContextBuilder,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// ignore: avoid-returning-widgets
Widget _itemBuilder(BuildContext context) =>
    const ChatMessageListItemWidget<IConversationChatMessage>();

// ignore: avoid-returning-widgets
Widget _itemContextBuilder(
  BuildContext context, {
  required Widget child,
}) =>
    DisposableProxyProvider<IConversationChatMessage,
        IConversationChatMessageBloc>(
      update: (context, chatMessage, previous) {
        if (previous != null && chatMessage.remoteId == previous.remoteId) {
          return previous;
        } else {
          return ConversationChatMessageBloc.createFromContext(
            context,
            chatMessage,
          );
        }
      },
      child: ProxyProvider<IConversationChatMessageBloc, IChatMessageBloc>(
        update: (context, value, _) => value,
        child: child,
      ),
    );
