import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/web_sockets/web_sockets_handler_impl.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:unifedi_api/unifedi_api.dart';

class MyAccountWebSocketsHandler extends WebSocketsChannelHandler {
  MyAccountWebSocketsHandler({
    required IUnifediApiWebSocketsService unifediApiWebSocketsService,
    required IStatusRepository statusRepository,
    required INotificationRepository notificationRepository,
    required IInstanceAnnouncementRepository instanceAnnouncementRepository,
    required IConversationChatRepository conversationRepository,
    required IPleromaChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc,
    required IConversationChatNewMessagesHandlerBloc
        conversationChatNewMessagesHandlerBloc,
    required this.chat,
    required this.notification,
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
          isFromHomeTimeline: true,
          handlerType: handlerType,
        );

  final bool chat;
  final bool notification;

  @override
  IDisposable initListener() => chat && notification
      ? unifediApiWebSocketsService.listenForAllMyAccountEvents(
          handlerType: handlerType,
          onEvent: handleEvent,
        )
      : chat
          ? unifediApiWebSocketsService.listenForChatMyAccountEvents(
              handlerType: handlerType,
              onEvent: handleEvent,
            )
          : unifediApiWebSocketsService.listenForNotificationMyAccountEvents(
              handlerType: handlerType,
              onEvent: handleEvent,
            );

  @override
  Future handleEvent(IUnifediApiWebSocketsEvent event) async {
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
