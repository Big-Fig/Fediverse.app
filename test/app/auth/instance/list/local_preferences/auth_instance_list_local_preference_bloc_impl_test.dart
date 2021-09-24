import 'package:fedi/app/access/list/local_preferences/auth_instance_list_local_preference_bloc_impl.dart';
import 'package:fedi/app/access/list/auth_instance_list_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../local_preferences/local_preferences_test_helper.dart';
import '../auth_instance_model_test_helper.dart';

// ignore_for_file: no-magic-number

void main() {
  test('save & load', () async {
    await LocalPreferencesMockHelper.testSaveAndLoad<UnifediApiAccessList,
        UnifediApiAccessListLocalPreferenceBloc>(
      defaultValue: UnifediApiAccessListLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          UnifediApiAccessListLocalPreferenceBloc(
        localPreferencesService,
      ),
      testObjectCreator: ({required String seed}) =>
          UnifediApiAccessListModelMockHelper.createTestUnifediApiAccessList(
        seed: seed,
      ),
    );
  });
}
