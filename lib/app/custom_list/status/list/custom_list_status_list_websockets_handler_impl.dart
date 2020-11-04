import 'package:fedi/app/chat/pleroma/pleroma_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/websockets/web_sockets_handler_impl.dart';
import 'package:fedi/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/cupertino.dart';

class CustomListStatusListWebSocketsHandler extends WebSocketsChannelHandler {
  CustomListStatusListWebSocketsHandler({
    @required String customListRemoteId,
    @required IPleromaWebSocketsService pleromaWebSocketsService,
    @required IStatusRepository statusRepository,
    @required INotificationRepository notificationRepository,
    @required IConversationChatRepository conversationRepository,
    @required IChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc,
  }) : super(
          webSocketsChannel: pleromaWebSocketsService.getListChannel(
            listId: customListRemoteId,
          ),
          statusRepository: statusRepository,
          notificationRepository: notificationRepository,
          conversationRepository: conversationRepository,
          chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
          statusListRemoteId: customListRemoteId,
          isFromHomeTimeline: false,
    statusConversationRemoteId: null,

        );

  static CustomListStatusListWebSocketsHandler createFromContext(
          BuildContext context,
          {@required String customListRemoteId}) =>
      CustomListStatusListWebSocketsHandler(
        customListRemoteId: customListRemoteId,
        pleromaWebSocketsService:
            IPleromaWebSocketsService.of(context, listen: false),
        notificationRepository:
            INotificationRepository.of(context, listen: false),
        conversationRepository:
            IConversationChatRepository.of(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        chatNewMessagesHandlerBloc:
            IChatNewMessagesHandlerBloc.of(context, listen: false),
      );

  @override
  String get logTag => "custom_list_timeline_websockets_handler_impl.dart";
}
