import 'package:fedi/app/toast/handling_type/toast_handling_type_model.dart';
import 'package:fedi/app/toast/settings/toast_settings_model.dart';

import '../../push/settings/push_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number
class ToastSettingsModelMockHelper {
  static ToastSettings createTestToastSettings({
    required String seed,
  }) =>
      // hack to be sure that seed1 and seed2 wil produce different objects
      ToastSettings.fromEnum(
        pushSettings: PushSettingsModelMockHelper.createTestPushSettings(
          seed: seed,
        ),
        handlingType: ToastHandlingType
            .values[seed.hashCode % ToastHandlingType.values.length],
      );
}
