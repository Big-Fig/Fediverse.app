import 'package:fedi/refactored/app/conversation/repository/conversation_repository.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/websockets/web_sockets_handler_impl.dart';
import 'package:fedi/refactored/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/widgets.dart';

class MyNotificationsWebSocketsHandler extends WebSocketsChannelHandler {
  MyNotificationsWebSocketsHandler({
    @required IPleromaWebSocketsService pleromaWebSocketsService,
    @required IStatusRepository statusRepository,
    @required INotificationRepository notificationRepository,
    @required IConversationRepository conversationRepository,
  }) : super(
          webSocketsChannel:
              pleromaWebSocketsService.getMyAccountChannel(notification: true),
          statusRepository: statusRepository,
          notificationRepository: notificationRepository,
          conversationRepository: conversationRepository,
        );

  static MyNotificationsWebSocketsHandler createFromContext(
          BuildContext context) =>
      MyNotificationsWebSocketsHandler(
        pleromaWebSocketsService:
            IPleromaWebSocketsService.of(context, listen: false),
        notificationRepository:
            INotificationRepository.of(context, listen: false),
        conversationRepository:
            IConversationRepository.of(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
      );

  @override
  String get logTag => "my_notifications_websockets_handler_impl.dart";
}
