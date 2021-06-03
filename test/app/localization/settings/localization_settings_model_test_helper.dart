import 'package:fedi/app/localization/settings/localization_settings_model.dart';

import '../../../localization/localization_model_test_helper.dart';

// ignore_for_file: no-magic-number
class LocalizationSettingsModelTestHelper {
  static LocalizationSettings createTestLocalizationSettings({
    required String seed,
  }) =>
      LocalizationSettings(
        localizationLocale:
            LocalizationModelTestHelper.createTestLocalizationLocale(
          seed: seed,
        ),
      );
}
