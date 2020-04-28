import 'package:fedi/refactored/app/conversation/repository/conversation_repository.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/websockets/web_sockets_handler_impl.dart';
import 'package:fedi/refactored/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/widgets.dart';

// todo: why we need this additional conversation channel?
class AccountConversationsWebSocketsHandler extends WebSocketsChannelHandler {
  AccountConversationsWebSocketsHandler({
    @required IPleromaWebSocketsService pleromaWebSocketsService,
    @required IStatusRepository statusRepository,
    @required INotificationRepository notificationRepository,
    @required IConversationRepository conversationRepository,
    @required String accountId,
  }) : super(
          webSocketsChannel:
              pleromaWebSocketsService.getDirectChannel(accountId: accountId),
          statusRepository: statusRepository,
          notificationRepository: notificationRepository,
          conversationRepository: conversationRepository,
        );

  static AccountConversationsWebSocketsHandler createFromContext(
          BuildContext context,
          {@required String accountId}) =>
      AccountConversationsWebSocketsHandler(
        accountId: accountId,
        pleromaWebSocketsService:
            IPleromaWebSocketsService.of(context, listen: false),
        notificationRepository:
            INotificationRepository.of(context, listen: false),
        conversationRepository:
            IConversationRepository.of(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
      );
}
