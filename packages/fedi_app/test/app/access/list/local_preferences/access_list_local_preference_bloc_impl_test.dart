// ignore_for_file: unnecessary_lambdas

import 'package:fedi_app/app/access/list/access_list_model.dart';
import 'package:fedi_app/app/access/list/local_preferences/access_list_local_preference_bloc_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../local_preferences/local_preferences_test_helper.dart';
import '../access_model_test_helper.dart';

// ignore_for_file: no-magic-number
// ignore_for_file: avoid-ignoring-return-values
void main() {
  test('save & load', () async {
    await LocalPreferencesMockHelper.testSaveAndLoad<AccessList,
        AccessListLocalPreferenceBloc>(
      defaultValue: AccessListLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) => AccessListLocalPreferenceBloc(
        localPreferencesService,
      ),
      testObjectCreator: ({required String seed}) =>
          UnifediApiAccessListModelMockHelper.createTestUnifediApiAccessList(
        seed: seed,
      ),
    );
  });
}
