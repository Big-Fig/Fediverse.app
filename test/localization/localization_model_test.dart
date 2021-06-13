import 'package:fedi/localization/localization_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../hive/hive_test_helper.dart';
import '../obj/obj_test_helper.dart';
import 'localization_model_test_helper.dart';

void main() {
  test('equal & hashcode & toString', () async {
    ObjTestHelper.testEqualsHashcodeToString(
      ({required String seed}) =>
          LocalizationModelTestHelper.createTestLocalizationLocale(
        seed: seed,
      ),
    );
  });
  test('localeString', () async {
    expect(
      LocalizationLocale(
        scriptCode: null,
        languageCode: 'en',
        countryCode: null,
      ).localeString,
      'en',
    );
    expect(
      LocalizationLocale(
        scriptCode: null,
        languageCode: 'en',
        countryCode: 'US',
      ).localeString,
      'en_US',
    );
    expect(
      LocalizationLocale(
        scriptCode: 'Hant',
        languageCode: 'zh',
        countryCode: 'TW',
      ).localeString,
      'zh_Hant_TW',
    );
  });

  test('hive adapter', () async {
    HiveTestHelper.testAdapter(
      () => LocalizationLocaleAdapter(),
    );
  });
}
