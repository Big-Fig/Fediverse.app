import 'dart:async';

import 'package:fedi/refactored/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/refactored/app/auth/instance/list/auth_instance_list_bloc.dart';
import 'package:fedi/refactored/app/push/handler/push_handler_bloc.dart';
import 'package:fedi/refactored/app/push/handler/unhandled/push_handler_unhandled_local_preferences_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/push/pleroma_push_model.dart';
import 'package:fedi/refactored/push/fcm/fcm_push_service.dart';
import 'package:fedi/refactored/push/push_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("push_handler_bloc_impl.dart");

class PushHandlerBloc extends DisposableOwner implements IPushHandlerBloc {
  final IPushHandlerUnhandledLocalPreferencesBloc unhandledLocalPreferencesBloc;
  final IFcmPushService fcmPushService;
  final IAuthInstanceListBloc instanceListBloc;
  final ICurrentAuthInstanceBloc currentInstanceBloc;

  final List<IPushRealTimeHandler> realTimeHandlers = [];

  PushHandlerBloc(
      {@required this.unhandledLocalPreferencesBloc,
      @required this.currentInstanceBloc,
      @required this.instanceListBloc,
      @required this.fcmPushService}) {
    addDisposable(streamSubscription:
        fcmPushService.messageStream.listen((pushMessage) async {
      var pleromaPushMessage = PleromaPushMessage.fromJson(pushMessage.data);

      bool handled = false;
      for (var handler in realTimeHandlers) {
        handled = await handler(pleromaPushMessage);
        if (handled) {
          break;
        }
      }

      if (!handled) {
        var instanceForMessage = instanceListBloc.findInstanceByCredentials(
            host: pleromaPushMessage.server, acct: pleromaPushMessage.account);

        if (instanceForMessage != null) {
          _logger.finest(() => "pleromaPushMessage = $pleromaPushMessage by \n"
              "\t instanceForMessage=$instanceForMessage");

          if (!currentInstanceBloc.isCurrentInstance(instanceForMessage)) {
            await unhandledLocalPreferencesBloc
                .addUnhandledMessage(pleromaPushMessage);

            if (pushMessage.type == PushMessageType.launch) {
              // launch after click on notification
              if (currentInstanceBloc.currentInstance != instanceForMessage) {
                currentInstanceBloc.changeCurrentInstance(instanceForMessage);
              }
            }
          }
        } else {
          _logger.severe(() => "Can't handle pleromaPushMessage = "
              "$pleromaPushMessage, because instance for message not found");
        }
      }
    }));
  }

  @override
  void addRealTimeHandler(pushHandler) {
    realTimeHandlers.add(pushHandler);
  }

  @override
  void removeRealTimeHandler(pushHandler) {
    realTimeHandlers.remove(pushHandler);
  }

  @override
  List<PleromaPushMessage> loadUnhandledMessagesForInstance(
          AuthInstance instance) =>
      unhandledLocalPreferencesBloc.loadUnhandledMessagesForInstance(instance);

  @override
  Future<bool> markAsHandled(List<PleromaPushMessage> messages) =>
      unhandledLocalPreferencesBloc.markAsHandled(messages);
}
