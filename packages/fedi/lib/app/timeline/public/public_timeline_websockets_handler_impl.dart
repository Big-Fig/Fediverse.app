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

class PublicTimelineWebSocketsHandler extends WebSocketsChannelHandler {
  PublicTimelineWebSocketsHandler({
    required IUnifediApiWebSocketsService unifediApiWebSocketsService,
    required IStatusRepository statusRepository,
    required INotificationRepository notificationRepository,
    required IInstanceAnnouncementRepository instanceAnnouncementRepository,
    required IConversationChatRepository conversationRepository,
    required IPleromaChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc,
    required IConversationChatNewMessagesHandlerBloc
        conversationChatNewMessagesHandlerBloc,
    required this.onlyLocal,
    required this.onlyRemote,
    required this.onlyMedia,
    required this.onlyFromInstance,
    required WebSocketsChannelHandlerType handlerType,
    required IMyAccountBloc myAccountBloc,
  }) : super(
          myAccountBloc: myAccountBloc,
          unifediApiWebSocketsService: unifediApiWebSocketsService,
          handlerType: handlerType,
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
        );

  final bool? onlyLocal;
  final bool? onlyRemote;
  final bool? onlyMedia;
  final String? onlyFromInstance;

  @override
  IDisposable initListener() {
    var onlyRemoteSupported = unifediApiWebSocketsService.isFeatureSupported(
      unifediApiWebSocketsService.listenForPublicEventsRemoteOnlyArgFeature,
    );
    var onlyFromInstanceRemoteSupported =
        unifediApiWebSocketsService.isFeatureSupported(
      unifediApiWebSocketsService
          .listenForPublicEventsOnlyFromInstanceArgFeature,
    );

    return unifediApiWebSocketsService.listenForPublicEvents(
      localOnly: onlyLocal == true,
      remoteOnly: onlyRemoteSupported ? onlyRemote : null,
      mediaOnly: onlyMedia == true,
      onlyFromInstance:
          onlyFromInstanceRemoteSupported ? onlyFromInstance : null,
      handlerType: handlerType,
      onEvent: handleEvent,
    );
  }

  @override
  String get logTag => 'public_timeline_websockets_handler_impl.dart';
}
