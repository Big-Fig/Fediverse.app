// ignore_for_file: unnecessary_lambdas

import 'package:fedi_app/app/pagination/settings/local_preferences/global/global_pagination_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../local_preferences/local_preferences_test_helper.dart';
import '../../pagination_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number
// ignore_for_file: avoid-ignoring-return-values
void main() {
  test('save & load', () async {
    await LocalPreferencesMockHelper.testSaveAndLoad<PaginationSettings,
        GlobalPaginationSettingsLocalPreferenceBloc>(
      defaultValue: GlobalPaginationSettingsLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          GlobalPaginationSettingsLocalPreferenceBloc(
        localPreferencesService,
      ),
      testObjectCreator: ({required String seed}) =>
          PaginationSettingsModelMockHelper.createTestPaginationSettings(
        seed: seed,
      ),
    );
  });
}
