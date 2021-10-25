import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import 'pleroma_api_notification_type_sealed.dart';

abstract class PleromaApiNotificationTypeMockHelper {
  static PleromaApiNotificationType generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: PleromaApiNotificationType.values,
      );
}
