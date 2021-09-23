import 'package:fedi/app/auth/host/access_token/auth_host_access_token_local_preference_bloc_impl.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unifedi_api/unifedi_api_mock_helper.dart';

import '../../../local_preferences/local_preferences_test_helper.dart';

// ignore_for_file: no-magic-number

void main() {
  test('save & load', () async {
    await LocalPreferencesMockHelper.testSaveAndLoad<UnifediApiOAuthToken,
        AuthHostAccessTokenLocalPreferenceBloc>(
      defaultValue: AuthHostAccessTokenLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          AuthHostAccessTokenLocalPreferenceBloc(
        localPreferencesService,
        host: 'host',
      ),
      testObjectCreator: ({required String seed}) =>
          UnifediApiOAuthTokenMockHelper.generate(
        seed: seed,
      ),
    );
  });
}
