import 'package:fedi/refactored/app/status/new_items/status_new_items_listener_bloc.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/notification/websockets/pleroma_notification_websockets_model.dart';
import 'package:fedi/refactored/pleroma/notification/websockets/pleroma_notification_websockets_service.dart';
import 'package:fedi/refactored/websockets/websockets_channel_impl.dart';
import 'package:flutter/widgets.dart';

class PublicTimelineNewItemsListenerBloc extends DisposableOwner
    implements IStatusNewItemsListenerBloc {
  final IPleromaNotificationWebSocketsService
      pleromaNotificationsWebSocketsService;

  WebSocketsChannel<PleromaNotificationWebSocketsEvent> channel;

  PublicTimelineNewItemsListenerBloc(
      {@required this.pleromaNotificationsWebSocketsService}) {
    channel =
        pleromaNotificationsWebSocketsService.getPublicChannel(local: false);

    addDisposable(disposable: channel);
  }

  @override
  Stream<List<IStatus>> newItemsStream;

//  @override
//  Stream<IStatus> get newItemsStream => channel.eventsStream.map(
//          (PleromaNotificationWebSocketsEvent event) {
//    if(event.eventType == PleromaNotificationWebSocketsEventType.update) {
//      var remoteStatus = event.parsePayloadAsStatus();
//    }
//  }).skipWhile(());
}
