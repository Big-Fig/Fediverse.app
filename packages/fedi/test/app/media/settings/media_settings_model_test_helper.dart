// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:fedi/app/media/settings/media_settings_model.dart';

// ignore_for_file: no-magic-number
class MediaSettingsModelMockHelper {
  static MediaSettings createTestMediaSettings({
    required String seed,
  }) =>
      // hack to be sure that seed1 and seed2 wil produce different objects
      MediaSettings(
        autoInit: seed == 'seed1'
            ? true
            : seed == 'seed2'
                ? false
                : seed.hashCode % 2 == 0,
        autoPlay: seed == 'seed1'
            ? true
            : seed == 'seed2'
                ? false
                : seed.hashCode % 2 == 1,
      );
}
