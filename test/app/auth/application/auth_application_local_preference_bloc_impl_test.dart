import 'package:fedi/app/auth/host/application/auth_host_application_local_preference_bloc_impl.dart';
import 'package:fedi/pleroma/api/application/pleroma_api_application_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../local_preferences/local_preferences_test_helper.dart';
import '../../../pleroma/api/application/pleroma_api_application_test_helper.dart';

// ignore_for_file: no-magic-number

void main() {
  test('save & load', () async {
    await LocalPreferencesTestHelper.testSaveAndLoad<
        PleromaApiClientApplication, AuthHostApplicationLocalPreferenceBloc>(
      defaultValue: AuthHostApplicationLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          AuthHostApplicationLocalPreferenceBloc(
        localPreferencesService,
        host: "host",
      ),
      testObjectCreator: ({required String seed}) =>
          PleromaApiApplicationTestHelper.createTestPleromaApiClientApplication(
        seed: seed,
      ),
    );
  });
}
