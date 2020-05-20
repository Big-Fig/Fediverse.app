import 'package:fedi/refactored/app/conversation/repository/conversation_repository.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/websockets/web_sockets_handler_impl.dart';
import 'package:fedi/refactored/pleroma/websockets/pleroma_websockets_model.dart';
import 'package:fedi/refactored/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/cupertino.dart';

class HomeTimelineWebSocketsHandler extends WebSocketsChannelHandler {
  HomeTimelineWebSocketsHandler({
    @required IPleromaWebSocketsService pleromaWebSocketsService,
    @required IStatusRepository statusRepository,
    @required INotificationRepository notificationRepository,
    @required IConversationRepository conversationRepository,
  }) : super(
            webSocketsChannel: pleromaWebSocketsService.getMyAccountChannel(
                notification: false),
            statusRepository: statusRepository,
            notificationRepository: notificationRepository,
            conversationRepository: conversationRepository,
            isFromHomeTimeline: true);

  static HomeTimelineWebSocketsHandler createFromContext(
          BuildContext context) =>
      HomeTimelineWebSocketsHandler(
        pleromaWebSocketsService:
            IPleromaWebSocketsService.of(context, listen: false),
        notificationRepository:
            INotificationRepository.of(context, listen: false),
        conversationRepository:
            IConversationRepository.of(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
      );

  @override
  Future handleEvent(PleromaWebSocketsEvent event) async {

    // todo: remove hack
    // it is for isHomeTimeline flag
    // other websockets handle can handle same Status and override this flag
    // we should be sure that handler with isHomeTimeline executes after all
    // other handlers
    await Future.delayed(Duration(seconds: 1));
    return super.handleEvent(event);
  }

  @override
  String get logTag => "home_timeline_websockets_handler_impl.dart";
}
