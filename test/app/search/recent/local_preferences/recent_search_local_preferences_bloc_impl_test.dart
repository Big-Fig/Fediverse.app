// ignore_for_file: unnecessary_lambdas

import 'package:fedi/app/search/recent/local_preferences/recent_search_local_preference_bloc_impl.dart';
import 'package:fedi/app/search/recent/recent_search_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../local_preferences/local_preferences_test_helper.dart';
import '../recent_search_model_test_helper.dart';

// ignore_for_file: no-magic-number

void main() {
  test('save & load', () async {
    await LocalPreferencesMockHelper.testSaveAndLoad<RecentSearchList,
        RecentSearchLocalPreferenceBloc>(
      defaultValue: RecentSearchLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) => RecentSearchLocalPreferenceBloc(
        localPreferencesService,
        userAtHost: 'user@host',
      ),
      testObjectCreator: ({required String seed}) =>
          RecentSearchModelMockHelper.createTestRecentSearchList(
        seed: seed,
      ),
    );
  });
}
