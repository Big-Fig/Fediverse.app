import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/web_sockets/web_sockets_handler_impl.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';

class HashtagStatusListWebSocketsHandler extends WebSocketsChannelHandler {
  HashtagStatusListWebSocketsHandler({
    required IUnifediApiWebSocketsService unifediApiWebSocketsService,
    required IStatusRepository statusRepository,
    required INotificationRepository notificationRepository,
    required IInstanceAnnouncementRepository instanceAnnouncementRepository,
    required IConversationChatRepository conversationRepository,
    required IPleromaChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc,
    required this.hashtag,
    required this.local,
    required IConversationChatNewMessagesHandlerBloc
        conversationChatNewMessagesHandlerBloc,
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

  final String hashtag;
  final bool? local;

  @override
  IDisposable initListener() =>
      unifediApiWebSocketsService.listenForHashtagEvents(
    tag: hashtag,
    localOnly: local == true,
    handlerType: handlerType,
    onEvent: handleEvent,
  );

  @override
  String get logTag => 'hashtag_timeline_websockets_handler_impl.dart';
}
