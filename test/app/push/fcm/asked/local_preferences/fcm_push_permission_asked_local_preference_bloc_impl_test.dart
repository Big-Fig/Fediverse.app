import 'package:fedi/app/push/fcm/asked/local_preferences/fcm_push_permission_asked_local_preference_bloc_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../local_preferences/local_preferences_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('save & load', () async {
    await LocalPreferencesTestHelper.testSaveAndLoad<bool,
        FcmPushPermissionAskedLocalPreferenceBloc>(
      defaultValue: FcmPushPermissionAskedLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          FcmPushPermissionAskedLocalPreferenceBloc(
        localPreferencesService,
        userAtHost: 'user@host',
      ),
      testObjectCreator: ({required String seed}) => seed.hashCode % 2 == 0,
    );
  });
}
