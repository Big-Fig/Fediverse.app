import 'package:fedi/app/chat/chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/conversation/repository/conversation_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/websockets/web_sockets_handler_impl.dart';
import 'package:fedi/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/cupertino.dart';

class HashtagStatusListWebSocketsHandler extends WebSocketsChannelHandler {
  HashtagStatusListWebSocketsHandler({
    @required String hashtag,
    @required IPleromaWebSocketsService pleromaWebSocketsService,
    @required IStatusRepository statusRepository,
    @required INotificationRepository notificationRepository,
    @required IConversationRepository conversationRepository,
    @required IChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc,
    @required bool local,
  }) : super(
            webSocketsChannel: pleromaWebSocketsService.getHashtagChannel(
              hashtag: hashtag,
              local: local,
            ),
            statusRepository: statusRepository,
            notificationRepository: notificationRepository,
            conversationRepository: conversationRepository,
            chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
            isFromHomeTimeline: false);

  static HashtagStatusListWebSocketsHandler createFromContext(
    BuildContext context, {
    @required String hashtag,
    @required bool local,
  }) =>
      HashtagStatusListWebSocketsHandler(
        hashtag: hashtag,
        local: local,
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
  String get logTag => "hashtag_timeline_websockets_handler_impl.dart";
}
