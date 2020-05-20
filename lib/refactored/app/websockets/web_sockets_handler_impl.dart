import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/refactored/app/conversation/repository/conversation_repository.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/websockets/web_sockets_handler.dart';
import 'package:fedi/refactored/pleroma/websockets/pleroma_websockets_model.dart';
import 'package:fedi/refactored/websockets/websockets_channel.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

abstract class WebSocketsChannelHandler extends DisposableOwner
    implements IWebSocketsHandler {
  var _logger;

  String get logTag;

  final IWebSocketsChannel<PleromaWebSocketsEvent> webSocketsChannel;
  final IStatusRepository statusRepository;
  final INotificationRepository notificationRepository;
  final IConversationRepository conversationRepository;

  final String statusListRemoteId;
  final String statusConversationRemoteId;
  final bool isFromHomeTimeline;

  WebSocketsChannelHandler({
    @required this.webSocketsChannel,
    @required this.statusRepository,
    @required this.conversationRepository,
    @required this.notificationRepository,
    this.statusListRemoteId,
    this.statusConversationRemoteId,
    this.isFromHomeTimeline,
  }) {

    _logger = Logger(logTag);
    addDisposable(streamSubscription:
        webSocketsChannel.eventsStream.listen((event) async {
      await handleEvent(event);
    }));
  }

  Future handleEvent(PleromaWebSocketsEvent event) async {
    _logger.finest(() => "event $event");

    switch (event?.eventType) {
      case PleromaWebSocketsEventType.update:
        await statusRepository.upsertRemoteStatus(event.parsePayloadAsStatus(),
            isFromHomeTimeline: isFromHomeTimeline,
            listRemoteId: statusListRemoteId,
            conversationRemoteId: statusConversationRemoteId);
        break;
      case PleromaWebSocketsEventType.notification:
        await notificationRepository.upsertRemoteNotification(
            event.parsePayloadAsNotification(),
            unread: true);
        break;
      case PleromaWebSocketsEventType.delete:
        // TODO: implement remote id
        //          var statusRemoteId = event.parsePayloadAsRemoteId();
        //          statusRepository.deleteByRemoteId(id);
        break;
      case PleromaWebSocketsEventType.filtersChanged:
        // nothing
        break;
      case PleromaWebSocketsEventType.conversation:
        await conversationRepository
            .upsertRemoteConversation(event.parsePayloadAsConversation());
        break;
    }
  }
}
