import 'package:fedi/app/chat/conversation/conversation_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/web_sockets/web_sockets_handler_impl.dart';
import 'package:fedi/pleroma/web_sockets/pleroma_web_sockets_model.dart';
import 'package:fedi/pleroma/web_sockets/pleroma_web_sockets_service.dart';
import 'package:fedi/web_sockets/listen_type/web_sockets_listen_type_model.dart';
import 'package:flutter/widgets.dart';

class MyAccountWebSocketsHandler extends WebSocketsChannelHandler {
  MyAccountWebSocketsHandler({
    @required IPleromaWebSocketsService pleromaWebSocketsService,
    @required IStatusRepository statusRepository,
    @required INotificationRepository notificationRepository,
    @required IConversationChatRepository conversationRepository,
    @required IPleromaChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc,
    @required
        IConversationChatNewMessagesHandlerBloc
            conversationChatNewMessagesHandlerBloc,
    @required bool chat,
    @required bool notification,
    @required WebSocketsListenType listenType,
  }) : super(
          webSocketsChannel: pleromaWebSocketsService.getMyAccountChannel(
            chat: chat,
            notification: notification,
          ),
          statusRepository: statusRepository,
          notificationRepository: notificationRepository,
          conversationRepository: conversationRepository,
          chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
          conversationChatNewMessagesHandlerBloc:
              conversationChatNewMessagesHandlerBloc,
          statusListRemoteId: null,
          statusConversationRemoteId: null,
          isFromHomeTimeline: true,
          listenType: listenType,
        );


  @override
  Future handleEvent(PleromaWebSocketsEvent event) async {
    // todo: remove hack
    // it is for isHomeTimeline flag
    // other websockets handle can handle same Status and override this flag
    // we should be sure that handler with isHomeTimeline executes after all
    // other handlers
    await Future.delayed(Duration(milliseconds: 500));
    return super.handleEvent(event);
  }

  @override
  String get logTag => "my_notifications_websockets_handler_impl.dart";
}
