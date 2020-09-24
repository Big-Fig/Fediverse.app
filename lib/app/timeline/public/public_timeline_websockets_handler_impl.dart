import 'package:fedi/app/chat/chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/conversation/repository/conversation_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/websockets/web_sockets_handler_impl.dart';
import 'package:fedi/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/cupertino.dart';

class PublicTimelineWebSocketsHandler extends WebSocketsChannelHandler {
  PublicTimelineWebSocketsHandler({
    @required IPleromaWebSocketsService pleromaWebSocketsService,
    @required IStatusRepository statusRepository,
    @required INotificationRepository notificationRepository,
    @required IConversationRepository conversationRepository,
    @required IChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc,
    @required bool local,
    @required bool onlyMedia,
  }) : super(
          webSocketsChannel: pleromaWebSocketsService.getPublicChannel(
            local: local,
            onlyMedia: local,
          ),
          statusRepository: statusRepository,
          notificationRepository: notificationRepository,
          conversationRepository: conversationRepository,
          chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
        );

  static PublicTimelineWebSocketsHandler createFromContext(
    BuildContext context, {
    @required bool local,
    @required bool onlyMedia,
  }) =>
      PublicTimelineWebSocketsHandler(
        local: local,
        onlyMedia: local,
        pleromaWebSocketsService:
            IPleromaWebSocketsService.of(context, listen: false),
        notificationRepository:
            INotificationRepository.of(context, listen: false),
        conversationRepository:
            IConversationRepository.of(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        chatNewMessagesHandlerBloc:
            IChatNewMessagesHandlerBloc.of(context, listen: false),
      );

  @override
  String get logTag => "public_timeline_websockets_handler_impl.dart";
}
