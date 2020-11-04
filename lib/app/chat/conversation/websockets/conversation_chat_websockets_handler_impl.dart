import 'package:fedi/app/chat/pleroma/pleroma_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/websockets/web_sockets_handler_impl.dart';
import 'package:fedi/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/widgets.dart';

class ConversationChatWebSocketsHandler extends WebSocketsChannelHandler {

  @override
  String get logTag => "conversation_chat_websockets_handler_impl.dart";

  ConversationChatWebSocketsHandler({
    @required IPleromaWebSocketsService pleromaWebSocketsService,
    @required IStatusRepository statusRepository,
    @required INotificationRepository notificationRepository,
    @required IConversationChatRepository conversationRepository,
    @required IPleromaChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc,
    @required String accountId,
  }) : super(
          webSocketsChannel:
              pleromaWebSocketsService.getDirectChannel(accountId: accountId),
          statusRepository: statusRepository,
          notificationRepository: notificationRepository,
          conversationRepository: conversationRepository,
          chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
          statusListRemoteId: null,
          statusConversationRemoteId: null,
          isFromHomeTimeline: false,
        );

  static ConversationChatWebSocketsHandler createFromContext(
    BuildContext context, {
    @required String accountId,
  }) =>
      ConversationChatWebSocketsHandler(
        accountId: accountId,
        pleromaWebSocketsService:
            IPleromaWebSocketsService.of(context, listen: false),
        notificationRepository:
            INotificationRepository.of(context, listen: false),
        conversationRepository:
            IConversationChatRepository.of(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        chatNewMessagesHandlerBloc:
            IPleromaChatNewMessagesHandlerBloc.of(context, listen: false),
      );

}
