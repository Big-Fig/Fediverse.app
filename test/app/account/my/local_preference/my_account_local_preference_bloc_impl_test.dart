import 'package:fedi/app/account/my/local_preferences/my_account_local_preference_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_model.dart';
import 'package:flutter_test/flutter_test.dart';


import '../../../../local_preferences/local_preferences_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  test('save & load', () async {
    await LocalPreferencesMockHelper.testSaveAndLoad<UnifediApiMyAccountWrapper,
        MyAccountLocalPreferenceBloc>(
      defaultValue: MyAccountLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) => MyAccountLocalPreferenceBloc(
        localPreferencesService,
        userAtHost: 'user@host',
      ),
      testObjectCreator: ({required String seed}) => UnifediApiMyAccountWrapper(
        unifediApiAccount:
            UnifediApiMyAccountMockHelper.createTestUnifediApiMyAccount(
          seed: seed,
        ),
      ),
    );
  });
}
