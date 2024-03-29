import 'package:fedi_app/app/emoji/picker/category/recent/emoji_picker_recent_category_model.dart';
import 'package:fedi_app/app/emoji/picker/category/recent/local_preferences/emoji_picker_recent_category_local_preference_bloc.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';

class EmojiPickerRecentCategoryLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<EmojiPickerRecentCategoryItemsList?>
    implements IEmojiPickerRecentCategoryLocalPreferenceBloc {
  EmojiPickerRecentCategoryLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(
          preferencesService: preferencesService,
          key: '$userAtHost.emoji.recent',
          schemaVersion: 1,
          jsonConverter: (json) =>
              EmojiPickerRecentCategoryItemsList.fromJson(json),
        );

  static const EmojiPickerRecentCategoryItemsList? defaultValue = null;

  @override
  EmojiPickerRecentCategoryItemsList? get defaultPreferenceValue =>
      defaultValue;
}
