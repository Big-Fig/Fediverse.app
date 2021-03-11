import 'dart:async';

import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/list/auth_instance_list_bloc.dart';
import 'package:fedi/app/push/handler/push_handler_bloc.dart';
import 'package:fedi/app/push/handler/push_handler_model.dart';
import 'package:fedi/app/push/handler/unhandled/push_handler_unhandled_local_preferences_bloc.dart';
import 'package:fedi/app/push/handler/unhandled/push_handler_unhandled_local_preferences_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/push/pleroma_push_model.dart';
import 'package:fedi/push/fcm/fcm_push_service.dart';
import 'package:fedi/push/push_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("push_handler_bloc_impl.dart");

class PushHandlerBloc extends DisposableOwner implements IPushHandlerBloc {
  final IPushHandlerUnhandledLocalPreferencesBloc unhandledLocalPreferencesBloc;
  final IFcmPushService fcmPushService;
  final IAuthInstanceListBloc instanceListBloc;
  final ICurrentAuthInstanceBloc currentInstanceBloc;

  final List<IPushRealTimeHandler> realTimeHandlers = [];

  PushHandlerBloc({
    @required this.unhandledLocalPreferencesBloc,
    @required this.currentInstanceBloc,
    @required this.instanceListBloc,
    @required this.fcmPushService,
  }) {
    addDisposable(
      streamSubscription: fcmPushService.messageStream.listen(
        (pushMessage) async {
          await handlePushMessage(pushMessage);
        },
      ),
    );
  }

  Future handlePushMessage(PushMessage pushMessage) async {
    var body = PleromaPushMessageBody.fromJson(pushMessage.data);

    var pushMessageHandler = PushHandlerMessage(
      pushMessage: pushMessage,
      body: body,
    );
    bool handled = false;
    for (var handler in realTimeHandlers) {
      handled = await handler(pushMessageHandler);
      if (handled) {
        break;
      }
    }

    _logger.finest(() => "handlePushMessage \n"
        "\t body =$body"
        "\t handled =$handled");

    if (!handled) {
      var instanceForMessage = instanceListBloc.findInstanceByCredentials(
          host: body.server, acct: body.account);

      if (instanceForMessage != null) {
        _logger.finest(() => "body = $body by \n"
            "\t instanceForMessage=$instanceForMessage");

        if (!currentInstanceBloc.isCurrentInstance(instanceForMessage)) {
          await unhandledLocalPreferencesBloc
              .addUnhandledMessage(pushMessageHandler);

          if (pushMessage.isLaunchOrResume) {
            // launch after click on notification
            if (currentInstanceBloc.currentInstance != instanceForMessage) {
              await currentInstanceBloc
                  .changeCurrentInstance(instanceForMessage);
            }
          }
        }
      } else {
        _logger.severe(() => "Can't handle body = "
            "$body, because instance for message not found");
      }
    }
  }

  @override
  void addRealTimeHandler(IPushRealTimeHandler pushHandler) {
    realTimeHandlers.add(pushHandler);
  }

  @override
  void removeRealTimeHandler(IPushRealTimeHandler pushHandler) {
    realTimeHandlers.remove(pushHandler);
  }

  @override
  List<PushHandlerMessage> loadUnhandledMessagesForInstance(
          AuthInstance instance) =>
      unhandledLocalPreferencesBloc.loadUnhandledMessagesForInstance(instance);

  @override
  Future<bool> markAsHandled(List<PushHandlerMessage> messages) =>
      unhandledLocalPreferencesBloc.markAsHandled(messages);

  @override
  Future markAsLaunchMessage(PushHandlerMessage message) async {
    var unhandledList = unhandledLocalPreferencesBloc.value;

    unhandledList.messages.remove(message);

    unhandledList.messages.add(
      message.copyWith(
        pushMessage: message.pushMessage.copyWith(
          typeString: PushMessageType.launch.toJsonValue(),
        ),
      ),
    );

    await unhandledLocalPreferencesBloc.setValue(
      PushHandlerUnhandledList(
        messages: unhandledList.messages,
      ),
    );
  }
}
