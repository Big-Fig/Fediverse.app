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

class PleromaChatWebSocketsHandler extends WebSocketsChannelHandler {
  @override
  String get logTag => 'pleroma_chat_websockets_handler_impl.dart';

  PleromaChatWebSocketsHandler({
    required IPleromaApiWebSocketsService pleromaWebSocketsService,
    required IStatusRepository statusRepository,
    required INotificationRepository notificationRepository,
    required IInstanceAnnouncementRepository instanceAnnouncementRepository,
    required IConversationChatRepository conversationRepository,
    required IPleromaChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc,
    required IConversationChatNewMessagesHandlerBloc
        conversationChatNewMessagesHandlerBloc,
    required WebSocketsListenType listenType,
    required IMyAccountBloc myAccountBloc,
  }) : super(
          myAccountBloc: myAccountBloc,
          webSocketsChannel: pleromaWebSocketsService.getMyAccountChannel(
            chat: true,
            notification: false,
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
          isFromHomeTimeline: false,
          listenType: listenType,
        );
}
