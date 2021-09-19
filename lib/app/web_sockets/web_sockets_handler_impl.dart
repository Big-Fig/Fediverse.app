import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/web_sockets/web_sockets_handler.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class WebSocketsChannelHandler extends DisposableOwner
    implements IWebSocketsHandler {
  // ignore: avoid-late-keyword
  late Logger _logger;

  String get logTag;

  // ignore: avoid-late-keyword
  late IDisposable webSocketsChannelDisposable;
  final IStatusRepository statusRepository;
  final INotificationRepository notificationRepository;
  final IInstanceAnnouncementRepository instanceAnnouncementRepository;
  final IConversationChatRepository conversationRepository;
  final IPleromaChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc;
  final IConversationChatNewMessagesHandlerBloc
      conversationChatNewMessagesHandlerBloc;

  final IMyAccountBloc myAccountBloc;

  final String? statusListRemoteId;
  final String? statusConversationRemoteId;
  final bool isFromHomeTimeline;
  final WebSocketsChannelHandlerType handlerType;
  final IUnifediApiWebSocketsService unifediApiWebSocketsService;

  WebSocketsChannelHandler({
    required this.unifediApiWebSocketsService,
    required this.statusRepository,
    required this.conversationRepository,
    required this.notificationRepository,
    required this.instanceAnnouncementRepository,
    required this.chatNewMessagesHandlerBloc,
    required this.conversationChatNewMessagesHandlerBloc,
    required this.statusListRemoteId,
    required this.statusConversationRemoteId,
    required this.myAccountBloc,
    required this.isFromHomeTimeline,
    required this.handlerType,
  }) {
    _logger = Logger(logTag);
    webSocketsChannelDisposable = initListener();
  }

  IDisposable initListener();

  Future handleEvent(IUnifediApiWebSocketsEvent event) async {
    _logger.finest(() => 'event $event');

    await event.typeAsUnifediApi.when(
      update: (_) async {
        await statusRepository.upsertRemoteStatusWithAllArguments(
          event.status!,
          isFromHomeTimeline: isFromHomeTimeline,
          listRemoteId: statusListRemoteId,
          conversationRemoteId: statusConversationRemoteId,
          batchTransaction: null,
        );
      },
      notification: (_) async {
        var notification = event.notification!;

        var pleromaNotificationType = notification.typeAsUnifediApi;
        // refresh to update followRequestCount
        if (pleromaNotificationType ==
            UnifediApiNotificationType.followRequestValue) {
          // ignore: unawaited_futures
          myAccountBloc.refreshFromNetwork(
            isNeedPreFetchRelationship: false,
          );
        }

        await notificationRepository.upsertRemoteNotification(
          notification,
          unread: true,
          batchTransaction: null,
        );

        var chatMessage = notification.chatMessage;
        if (chatMessage != null) {
          await chatNewMessagesHandlerBloc.handleNewMessage(chatMessage);
        }
      },
      delete: (_) async {
        var statusRemoteId = event.id!;

        await statusRepository.markStatusAsDeleted(
          statusRemoteId: statusRemoteId,
        );
      },
      filtersChanged: (_) {
        // TODO: Not implemented yet
      },
      announcement: (_) async {
        var announcement = event.announcement!;

        await instanceAnnouncementRepository.upsertInRemoteType(
          announcement,
        );
      },
      conversation: (_) async {
        await conversationChatNewMessagesHandlerBloc.handleChatUpdate(
          event.conversation!,
        );
      },
      chatUpdate: (_) async {
        var chat = event.chat!;
        await chatNewMessagesHandlerBloc.handleChatUpdate(chat);
      },
      // ignore: no-equal-arguments
      followRelationshipsUpdate: (_) {
        // TODO: Not implemented yet
      },
      // ignore: no-equal-arguments
      unknown: (_) {
        // TODO: Not implemented yet
      },
    );
  }
}
