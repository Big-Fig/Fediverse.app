import 'package:fedi/push/push_model.dart';

// ignore_for_file: no-magic-number
class PushModelMockHelper {
  static PushMessage createTestPushMessage({
    required String seed,
  }) =>
      PushMessage(
        data: <String, String>{
          'seed1': seed + '1',
          'seed2': seed + '2',
        },
        typeString: PushMessageType
            .values[seed.hashCode % PushMessageType.values.length]
            .toJsonValue(),
        notification: createTestPushNotification(seed: seed),
      );

  static PushNotification createTestPushNotification({
    required String seed,
  }) =>
      PushNotification(
        title: seed + 'title',
        body: seed + 'body',
      );
}
