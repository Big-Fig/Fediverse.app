import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/web_sockets/web_sockets_handler_impl.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:base_fediverse_api/base_fediverse_api.dart';

class MyAccountWebSocketsHandler extends WebSocketsChannelHandler {
  MyAccountWebSocketsHandler({
    required IPleromaApiWebSocketsService pleromaWebSocketsService,
    required IStatusRepository statusRepository,
    required INotificationRepository notificationRepository,
    required IInstanceAnnouncementRepository instanceAnnouncementRepository,
    required IConversationChatRepository conversationRepository,
    required IPleromaChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc,
    required IConversationChatNewMessagesHandlerBloc
        conversationChatNewMessagesHandlerBloc,
    required bool chat,
    required bool notification,
    required WebSocketsListenType listenType,
    required IMyAccountBloc myAccountBloc,
  }) : super(
          myAccountBloc: myAccountBloc,
          webSocketsChannel: pleromaWebSocketsService.getMyAccountChannel(
            chat: chat,
            notification: notification,
          ),
          statusRepository: statusRepository,
          notificationRepository: notificationRepository,
          instanceAnnouncementRepository: instanceAnnouncementRepository,
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
  Future handleEvent(PleromaApiWebSocketsEvent event) async {
    // todo: remove hack
    // it is for isHomeTimeline flag
    // other websockets handle can handle same Status and override this flag
    // we should be sure that handler with isHomeTimeline executes after all
    // other handlers
    // ignore: no-magic-number
    await Future.delayed(Duration(milliseconds: 500));

    return super.handleEvent(event);
  }

  @override
  String get logTag => 'my_notifications_websockets_handler_impl.dart';
}
