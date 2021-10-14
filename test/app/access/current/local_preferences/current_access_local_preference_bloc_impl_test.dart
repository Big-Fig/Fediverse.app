// ignore_for_file: unnecessary_lambdas

import 'package:fedi/app/access/current/local_preferences/current_access_local_preference_bloc_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:unifedi_api/unifedi_api_mock_helper.dart';

import '../../../../local_preferences/local_preferences_test_helper.dart';

// ignore_for_file: no-magic-number

void main() {
  test('save & load', () async {
    await LocalPreferencesMockHelper.testSaveAndLoad<UnifediApiAccess,
        CurrentUnifediApiAccessLocalPreferenceBloc>(
      defaultValue: CurrentUnifediApiAccessLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          CurrentUnifediApiAccessLocalPreferenceBloc(
        localPreferencesService,
      ),
      testObjectCreator: ({required String seed}) =>
          UnifediApiAccessMockHelper.generate(
        seed: seed,
      ),
    );
  });
}
