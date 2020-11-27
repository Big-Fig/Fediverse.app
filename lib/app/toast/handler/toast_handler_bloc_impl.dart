import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/push/handler/push_handler_bloc.dart';
import 'package:fedi/app/push/handler/push_handler_model.dart';
import 'package:fedi/app/toast/handler/toast_handler_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_bloc.dart';
import 'package:fedi/app/toast/toast_service.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:fedi/pleroma/push/pleroma_push_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

final _logger = Logger("toast_handler_bloc_impl.dart");

class ToastHandlerBloc extends DisposableOwner implements IToastHandlerBloc {
  // TODO: remote context field?
  final BuildContext context;
  final IToastService toastService;
  final IToastSettingsBloc toastSettingsBloc;
  final AuthInstance currentInstance;
  final IPushHandlerBloc pushHandlerBloc;

  ToastHandlerBloc({
    @required this.context,
    @required this.toastService,
    @required this.toastSettingsBloc,
    @required this.currentInstance,
    @required this.pushHandlerBloc,
  }) {
    pushHandlerBloc.addRealTimeHandler(handlePush);
    addDisposable(
      disposable: CustomDisposable(
        () async {
          pushHandlerBloc.removeRealTimeHandler(handlePush);
        },
      ),
    );
  }

  Future<bool> handlePush(PushHandlerMessage pushHandlerMessage) async {
    PleromaPushMessageBody pleromaPushMessage = pushHandlerMessage.body;

    var isForCurrentInstance = currentInstance.isInstanceWithHostAndAcct(
        host: pleromaPushMessage.server, acct: pleromaPushMessage.account);

    var notificationType = pleromaPushMessage.notificationType;

    var pleromaNotificationType = notificationType.toPleromaNotificationType();

    var enabled =
        toastSettingsBloc.isNotificationTypeEnabled(pleromaNotificationType);
    _logger
        .finest(() => "handlePush isForCurrentInstance $isForCurrentInstance \n"
            "pleromaNotificationType $pleromaNotificationType \n"
            "enabled $enabled");

    if (enabled && !isForCurrentInstance) {
      var title = "${pleromaPushMessage.account}@${pleromaPushMessage.server}"
          " "
          "${pushHandlerMessage.pushMessage.notification.title}";
      toastService.showInfoToast(
        context: context,
        title: title,
        content: pushHandlerMessage.pushMessage.notification.body,
      );
    }

    return false;
  }
}
