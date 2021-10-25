import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import 'unifedi_api_notification_type_sealed.dart';

abstract class UnifediApiNotificationTypeMockHelper {
  static UnifediApiNotificationType generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: UnifediApiNotificationType.values,
      );
}
