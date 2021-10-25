import 'package:fedi_app/app/push/permission/ask/local_preferences/ask_push_permission_local_preference_bloc_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../local_preferences/local_preferences_test_helper.dart';

// ignore_for_file: no-magic-number
// ignore_for_file: avoid-ignoring-return-values
void main() {
  test('save & load', () async {
    await LocalPreferencesMockHelper.testSaveAndLoad<bool,
        AskPushPermissionLocalPreferenceBloc>(
      defaultValue: AskPushPermissionLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          AskPushPermissionLocalPreferenceBloc(
        localPreferencesService,
        userAtHost: 'user@host',
      ),
      testObjectCreator: ({required String seed}) => seed.hashCode % 2 == 0,
    );
  });
}
