import 'package:fedi/app/status/post/settings/post_status_settings_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

import '../../../../localization/localization_model_test_helper.dart';

// ignore_for_file: no-magic-number
class PostStatusSettingsModelMockHelper {
  static PostStatusSettings createTestPostStatusSettings({
    required String seed,
  }) =>
      PostStatusSettings(
        markMediaAsNsfwOnAttach: seed.hashCode % 2 == 0,
        dontUploadMediaDuringEditing: seed.hashCode % 2 == 1,
        defaultVisibilityString: UnifediApiVisibility
            .values[seed.hashCode % UnifediApiVisibility.values.length]
            .stringValue,
        defaultStatusLocale:
            LocalizationModelMockHelper.createTestLocalizationLocale(
          seed: seed,
        ),
      );
}
