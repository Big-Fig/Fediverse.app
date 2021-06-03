import 'package:fedi/app/auth/instance/list/auth_instance_list_model.dart';
import 'package:fedi/app/auth/instance/list/local_preferences/auth_instance_list_local_preference_bloc_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../local_preferences/local_preferences_test_helper.dart';
import '../auth_instance_model_test_helper.dart';

// ignore_for_file: no-magic-number

void main() {
  test('save & load', () async {
    await LocalPreferencesTestHelper.testSaveAndLoad<AuthInstanceList,
        AuthInstanceListLocalPreferenceBloc>(
      defaultValue: AuthInstanceListLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          AuthInstanceListLocalPreferenceBloc(
        localPreferencesService,
      ),
      testObjectCreator: ({required String seed}) =>
          AuthInstanceListModelTestHelper.createTestAuthInstanceList(
        seed: seed,
      ),
    );
  });
}
