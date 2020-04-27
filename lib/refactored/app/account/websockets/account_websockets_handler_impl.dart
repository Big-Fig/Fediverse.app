import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/status/websockets/status_websockets_handler.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/websockets/pleroma_websockets_model.dart';


import 'package:fedi/refactored/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/widgets.dart';

class AccountWebSocketsHandler extends DisposableOwner
    implements IStatusWebSocketsHandler {
  final String accountRemoteId;
  final IPleromaWebSocketsService pleromaWebSocketsService;
  final IStatusRepository statusRepository;

  AccountWebSocketsHandler(
      {@required this.pleromaWebSocketsService,
        @required this.statusRepository,
        @required this.accountRemoteId,
      }) {
    var userWebSocketsChannel = pleromaWebSocketsService
        .getAccountChannel(accountId: accountRemoteId, notification: false);

    // todo: handle all event types
    addDisposable(
        streamSubscription: userWebSocketsChannel.eventsStream.listen((
            event) async {
          if (event?.eventType == PleromaWebSocketsEventType.update) {
            var remoteStatus = event.parsePayloadAsStatus();

            await statusRepository.upsertRemoteStatus(
                remoteStatus, listRemoteId: null, conversationRemoteId: null);
          }
        }));
  }
}