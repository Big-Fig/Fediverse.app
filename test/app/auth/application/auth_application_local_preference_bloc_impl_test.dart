import 'package:fedi/app/auth/host/application/auth_host_application_local_preference_bloc_impl.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../local_preferences/local_preferences_test_helper.dart';
import 'package:unifedi_api/unifedi_api_mock_helper.dart';

// ignore_for_file: no-magic-number

void main() {
  test('save & load', () async {
    await LocalPreferencesMockHelper.testSaveAndLoad<
        UnifediApiClientApplication, AuthHostApplicationLocalPreferenceBloc>(
      defaultValue: AuthHostApplicationLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          AuthHostApplicationLocalPreferenceBloc(
        localPreferencesService,
        host: 'host',
      ),
      testObjectCreator: ({required String seed}) =>
          UnifediApiClientApplicationMockHelper.generate(
        seed: seed,
      ),
    );
  });
}
