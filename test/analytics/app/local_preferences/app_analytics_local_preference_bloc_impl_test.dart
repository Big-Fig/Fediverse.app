// ignore_for_file: unnecessary_lambdas

import 'package:fedi/analytics/app/app_analytics_model.dart';
import 'package:fedi/analytics/app/local_preferences/app_analytics_local_preference_bloc_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../local_preferences/local_preferences_test_helper.dart';
import '../app_analytics_model_test_helper.dart';

// ignore_for_file: no-magic-number
// ignore_for_file: avoid-ignoring-return-values
void main() {
  test('save & load', () async {
    await LocalPreferencesMockHelper.testSaveAndLoad<AppAnalyticsData,
        AppAnalyticsLocalPreferenceBloc>(
      defaultValue: AppAnalyticsLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          AppAnalyticsLocalPreferenceBloc(localPreferencesService),
      testObjectCreator: ({required String seed}) =>
          AppAnalyticsModelMockHelper.createTestAppAnalyticsData(
        seed: seed,
      ),
    );
  });
}
