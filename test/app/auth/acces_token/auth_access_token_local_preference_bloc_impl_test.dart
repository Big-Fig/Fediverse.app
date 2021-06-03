import 'package:fedi/app/auth/host/access_token/auth_host_access_token_local_preference_bloc_impl.dart';
import 'package:fedi/pleroma/api/oauth/pleroma_api_oauth_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../local_preferences/local_preferences_test_helper.dart';
import '../../../pleroma/api/oauth/pleroma_api_oauth_test_helper.dart';

// ignore_for_file: no-magic-number

void main() {
  test('save & load', () async {
    await LocalPreferencesTestHelper.testSaveAndLoad<PleromaApiOAuthToken,
        AuthHostAccessTokenLocalPreferenceBloc>(
      defaultValue: AuthHostAccessTokenLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          AuthHostAccessTokenLocalPreferenceBloc(
        localPreferencesService,
        host: 'host',
      ),
      testObjectCreator: ({required String seed}) =>
          PleromaApiOAuthTestHelper.createTestPleromaApiOAuthToken(
        seed: seed,
      ),
    );
  });
}
