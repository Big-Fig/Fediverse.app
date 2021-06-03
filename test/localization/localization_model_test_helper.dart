import 'package:fedi/localization/localization_model.dart';

// ignore_for_file: no-magic-number
class LocalizationModelTestHelper {
  static LocalizationLocale createTestLocalizationLocale({
    required String seed,
  }) =>
      LocalizationLocale(
        languageCode: (seed.hashCode % 10).toString(),
        countryCode: (seed.hashCode % 4).toString(),
        scriptCode: (seed.hashCode % 3).toString(),
      );
}
