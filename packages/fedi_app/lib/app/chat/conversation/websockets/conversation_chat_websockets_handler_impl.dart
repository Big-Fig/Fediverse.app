import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/my/my_account_bloc.dart';
import 'package:fedi_app/app/chat/conversation/conversation_chat_new_messages_handler_bloc.dart';
import 'package:fedi_app/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi_app/app/chat/unifedi/unifedi_chat_new_messages_handler_bloc.dart';
import 'package:fedi_app/app/instance/announcement/repository/instance_announcement_repository.dart';
import 'package:fedi_app/app/notification/repository/notification_repository.dart';
import 'package:fedi_app/app/status/repository/status_repository.dart';
import 'package:fedi_app/app/web_sockets/web_sockets_handler_impl.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:unifedi_api/unifedi_api.dart';

class ConversationChatWebSocketsHandler extends WebSocketsChannelHandler {
  @override
  String get logTag => 'conversation_chat_websockets_handler_impl.dart';

  ConversationChatWebSocketsHandler({
    required IUnifediApiWebSocketsService unifediApiWebSocketsService,
    required IStatusRepository statusRepository,
    required INotificationRepository notificationRepository,
    required IInstanceAnnouncementRepository instanceAnnouncementRepository,
    required IConversationChatRepository conversationRepository,
    required IUnifediChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc,
    required IConversationChatNewMessagesHandlerBloc
        conversationChatNewMessagesHandlerBloc,
    required this.accountId,
    required WebSocketsChannelHandlerType handlerType,
    required IMyAccountBloc myAccountBloc,
  }) : super(
          unifediApiWebSocketsService: unifediApiWebSocketsService,
          myAccountBloc: myAccountBloc,
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
          handlerType: handlerType,
        );

  final String? accountId;

  @override
  IDisposable initListener() => accountId != null
      ? unifediApiWebSocketsService.listenForAccountConversationEvents(
          accountId: accountId!,
          handlerType: handlerType,
          onEvent: handleEvent,
        )
      : unifediApiWebSocketsService.listenForAllConversationEvents(
          handlerType: handlerType,
          onEvent: handleEvent,
        );
}
