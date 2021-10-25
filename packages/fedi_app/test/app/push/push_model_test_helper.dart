import 'package:fedi_app/push/push_model.dart';

// ignore_for_file: no-magic-number
class PushModelMockHelper {
  static PushMessage createTestPushMessage({
    required String seed,
  }) =>
      PushMessage(
        typeString: PushMessageType
            .values[seed.hashCode % PushMessageType.values.length]
            .toJsonValue(),
        notification: createTestPushNotification(
          seed: seed,
        ),
        data: <String, String>{
          'seed1': seed + '1',
          'seed2': seed + '2',
        },
      );

  static PushNotification createTestPushNotification({
    required String seed,
  }) =>
      PushNotification(
        title: seed + 'title',
        body: seed + 'body',
      );
}
