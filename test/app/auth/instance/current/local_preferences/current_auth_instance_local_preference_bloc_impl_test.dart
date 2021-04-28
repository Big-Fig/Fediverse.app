import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/current/local_preferences/current_auth_instance_local_preference_bloc_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../local_preferences/local_preferences_test_helper.dart';
import '../../auth_instance_model_test_helper.dart';

// ignore_for_file: no-magic-number

void main() {
  test('save & load', () async {
    await LocalPreferencesTestHelper.testSaveAndLoad<AuthInstance,
        CurrentAuthInstanceLocalPreferenceBloc>(
      defaultValue: CurrentAuthInstanceLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          CurrentAuthInstanceLocalPreferenceBloc(
        localPreferencesService,
      ),
      testObjectCreator: ({required String seed}) =>
          AuthInstanceModelTestHelper.createTestAuthInstance(
        seed: seed,
      ),
    );
  });
}
