// ignore_for_file: unnecessary_lambdas

import 'package:fedi/app/emoji/picker/category/recent/emoji_picker_recent_category_model.dart';
import 'package:fedi/app/emoji/picker/category/recent/local_preferences/emoji_picker_recent_category_local_preference_bloc_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../local_preferences/local_preferences_test_helper.dart';
import '../emoji_picker_recent_test_helper.dart';

// ignore_for_file: no-magic-number
// ignore_for_file: avoid-ignoring-return-values
void main() {
  test('save & load', () async {
    await LocalPreferencesMockHelper.testSaveAndLoad<
        EmojiPickerRecentCategoryItemsList,
        EmojiPickerRecentCategoryLocalPreferenceBloc>(
      defaultValue: EmojiPickerRecentCategoryLocalPreferenceBloc.defaultValue,
      blocCreator: (localPreferencesService) =>
          EmojiPickerRecentCategoryLocalPreferenceBloc(
        localPreferencesService,
        userAtHost: 'user@host',
      ),
      testObjectCreator: ({required String seed}) =>
          EmojiPickerRecentCategoryItemsListModelMockHelper
              .createTestEmojiPickerRecentCategoryItemsList(
        seed: seed,
      ),
    );
  });
}
