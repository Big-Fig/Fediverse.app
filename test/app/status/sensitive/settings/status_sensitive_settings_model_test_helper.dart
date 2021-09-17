import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_model.dart';

// ignore_for_file: no-magic-number
class StatusSensitiveSettingsModelMockHelper {
  static StatusSensitiveSettings createTestStatusSensitiveSettings({
    required String seed,
  }) =>
      StatusSensitiveSettings(
        isAlwaysShowSpoiler: seed.hashCode % 2 == 1,
        isAlwaysShowNsfw: seed.hashCode % 2 == 0,
        nsfwDisplayDelayDurationMicrosecondsTotal:
            Duration(seconds: seed.hashCode % 60).inMicroseconds,
      );
}
