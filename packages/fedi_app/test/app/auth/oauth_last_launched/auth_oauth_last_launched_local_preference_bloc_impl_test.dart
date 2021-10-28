import 'package:fedi_app/app/auth/oauth_last_launched/local_preferences/access_oauth_last_launched_host_to_login_local_preference_bloc_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../local_preferences/local_preferences_test_helper.dart';

// ignore_for_file: no-magic-number
// ignore_for_file: avoid-ignoring-return-values
void main() {
  test('save & load', () async {
    await LocalPreferencesMockHelper.testSaveAndLoad<String,
        AccessOAuthLastLaunchedHostToLoginLocalPreferenceBloc>(
      defaultValue: null,
      blocCreator: (localPreferencesService) =>
          AccessOAuthLastLaunchedHostToLoginLocalPreferenceBloc(
        localPreferencesService,
      ),
      testObjectCreator: ({required String seed}) => seed,
    );
  });
}
