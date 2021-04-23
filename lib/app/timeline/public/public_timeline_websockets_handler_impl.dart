import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/web_sockets/web_sockets_handler_impl.dart';
import 'package:fedi/pleroma/api/web_sockets/pleroma_web_sockets_service.dart';
import 'package:fedi/web_sockets/listen_type/web_sockets_listen_type_model.dart';

class PublicTimelineWebSocketsHandler extends WebSocketsChannelHandler {
  PublicTimelineWebSocketsHandler({
    required IPleromaWebSocketsService pleromaWebSocketsService,
    required IStatusRepository statusRepository,
    required INotificationRepository notificationRepository,
    required IConversationChatRepository conversationRepository,
    required IPleromaChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc,
    required
        IConversationChatNewMessagesHandlerBloc
            conversationChatNewMessagesHandlerBloc,
    required bool? onlyLocal,
    required bool? onlyRemote,
    required bool? onlyMedia,
    required WebSocketsListenType listenType,
    required String? onlyFromInstance,
    required IMyAccountBloc myAccountBloc,
  }) : super(
          myAccountBloc: myAccountBloc,
          webSocketsChannel: pleromaWebSocketsService.getPublicChannel(
            onlyLocal: onlyLocal,
            onlyRemote: onlyRemote,
            onlyFromInstance: onlyFromInstance,
            onlyMedia: onlyMedia,
          ),
          listenType: listenType,
          statusRepository: statusRepository,
          notificationRepository: notificationRepository,
          conversationRepository: conversationRepository,
          chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
          conversationChatNewMessagesHandlerBloc:
              conversationChatNewMessagesHandlerBloc,
          statusListRemoteId: null,
          statusConversationRemoteId: null,
          isFromHomeTimeline: false,
        );

  @override
  String get logTag => "public_timeline_websockets_handler_impl.dart";
}
