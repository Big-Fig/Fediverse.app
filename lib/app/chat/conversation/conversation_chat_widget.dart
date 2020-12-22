import 'package:fedi/app/chat/chat_widget.dart';
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
              child: const ChatWidgetBody(
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

// import 'package:fedi/generated/l10n.dart';
// import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
// import 'package:fedi/app/chat/conversation/conversation_chat_bloc.dart';
// import 'package:fedi/app/chat/conversation/status/context_api/conversation_chat_status_list_context_api_bloc_impl.dart';
// import 'package:fedi/app/chat/conversation/status/conversation_api/conversation_chat_status_list_conversation_api_bloc_impl.dart';
// import 'package:fedi/app/chat/conversation/status/conversation_chat_status_list_widget.dart';
// import 'package:fedi/app/chat/conversation/status/list/cached/conversation_chat_status_list_bloc_impl.dart';
// import 'package:fedi/app/message/post_message_bloc.dart';
// import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
// import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc_impl.dart';
// import 'package:fedi/app/status/pagination/list/status_cached_pagination_list_with_new_items_bloc_impl.dart';
// import 'package:fedi/app/status/post/post_status_widget.dart';
// import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
// import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
// import 'package:fedi/app/ui/fedi_padding.dart';
// import 'package:fedi/disposable/disposable_provider.dart';
// import 'package:fedi/ui/scroll/unfocus_on_scroll_area_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
//
// class ConversationChatWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var conversationBloc = IConversationChatBloc.of(context, listen: true);
//     return FediAsyncInitLoadingWidget(
//         asyncInitLoadingBloc: conversationBloc,
//         loadingFinishedBuilder: (context) {
//           return DisposableProvider<IStatusCachedListBloc>(
//             create: (context) {
//               return _createStatusListBloc(context, conversationBloc);
//             },
//             child: StatusCachedPaginationBloc.provideToContext(
//               context,
//               child:
//                   StatusCachedPaginationListWithNewItemsBloc.provideToContext(
//                 context,
//                 mergeNewItemsImmediately: true,
//                 child: _buildBody(context, conversationBloc),
//                 mergeOwnStatusesImmediately: false,
//               ),
//             ),
//           );
//         });
//   }
//
//   Widget _buildBody(
//     BuildContext context,
//     IConversationChatBloc conversationBloc,
//   ) {
//     var postMessageBloc = IPostMessageBloc.of(context, listen: false);
//     return StreamBuilder<bool>(
//         stream: postMessageBloc.isExpandedStream,
//         initialData: postMessageBloc.isExpanded,
//         builder: (context, snapshot) {
//           var isPostMessageExpanded = snapshot.data;
//
//           var postMessageWidget = const _ConversationChatPostStatusWidget();
//
//           if (isPostMessageExpanded) {
//             return postMessageWidget;
//           } else {
//             return Column(
//               children: <Widget>[
//                 Expanded(
//                   child: UnfocusOnScrollAreaWidget(
//                     child: Padding(
//                       padding: FediPadding.horizontalBigPadding,
//                       child: ConversationChatStatusListWidget(
//                         key: PageStorageKey(
//                             conversationBloc.conversation.remoteId),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const FediUltraLightGreyDivider(),
//                 postMessageWidget
//               ],
//             );
//           }
//         });
//   }
//
//
// class _ConversationChatPostStatusWidget extends StatelessWidget {
//   const _ConversationChatPostStatusWidget({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return PostStatusWidget(
//       hintText: S.of(context).app_chat_post_field_content_hint,
//     );
//   }
// }
