import 'package:fedi/app/chat/pleroma/pleroma_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/websockets/web_sockets_handler_impl.dart';
import 'package:fedi/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/widgets.dart';

class MyNotificationsWebSocketsHandler extends WebSocketsChannelHandler {
  MyNotificationsWebSocketsHandler({
    @required IPleromaWebSocketsService pleromaWebSocketsService,
    @required IStatusRepository statusRepository,
    @required INotificationRepository notificationRepository,
    @required IConversationChatRepository conversationRepository,
    @required IPleromaChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc,
  }) : super(
          webSocketsChannel: pleromaWebSocketsService.getMyAccountChannel(
              notification: true, chat: false),
          statusRepository: statusRepository,
          notificationRepository: notificationRepository,
          conversationRepository: conversationRepository,
          chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
          statusListRemoteId: null,
          statusConversationRemoteId: null,
          isFromHomeTimeline: true,
        );

  static MyNotificationsWebSocketsHandler createFromContext(
          BuildContext context) =>
      MyNotificationsWebSocketsHandler(
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

  @override
  String get logTag => "my_notifications_websockets_handler_impl.dart";
}
