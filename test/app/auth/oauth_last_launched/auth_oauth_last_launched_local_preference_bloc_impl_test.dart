import 'package:fedi/app/auth/oauth_last_launched/local_preferences/auth_oauth_last_launched_host_to_login_local_preference_bloc_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../local_preferences/local_preferences_test_helper.dart';

// ignore_for_file: no-magic-number

void main() {
  test('save & load', () async {
    await LocalPreferencesMockHelper.testSaveAndLoad<String,
        AuthOAuthLastLaunchedHostToLoginLocalPreferenceBloc>(
      defaultValue: null,
      blocCreator: (localPreferencesService) =>
          AuthOAuthLastLaunchedHostToLoginLocalPreferenceBloc(
        localPreferencesService,
      ),
      testObjectCreator: ({required String seed}) => seed,
    );
  });
}
