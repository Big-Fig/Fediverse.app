import 'package:fedi_app/app/push/fedi_push_notification_model_impl.dart';
import 'package:unifedi_api/unifedi_api_mock_helper.dart';

abstract class FediPushNotificationMockHelper {
  // ignore: long-method
  static FediPushNotification generate({
    required String seed,
  }) =>
      FediPushNotification(
        account: seed + 'account',
        notificationAction: seed + 'notificationAction',
        notificationActionInput: seed + 'notificationActionInput',
        notificationId: seed + 'notificationId',
        notificationType: seed + 'notificationType',
        server: seed + 'server',
        unifediApiNotification: UnifediApiNotificationMockHelper.generate(
          seed: seed + 'unifediApiNotification',
        ),
      );
}
