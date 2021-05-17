import 'package:fedi/app/emoji/picker/category/custom_image_url/emoji_picker_custom_image_url_category_model.dart';
import 'package:fedi/app/emoji/picker/category/custom_image_url/local_preferences/emoji_picker_custom_image_url_category_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class EmojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<EmojiPickerCustomImageUrlCategoryItems?>
    implements IEmojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc {
  EmojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(
          preferencesService: preferencesService,
          key: '$userAtHost.emoji.custom',
          schemaVersion: 1,
          jsonConverter: (json) =>
              EmojiPickerCustomImageUrlCategoryItems.fromJson(json),
        );

  static const EmojiPickerCustomImageUrlCategoryItems? defaultValue = null;

  @override
  EmojiPickerCustomImageUrlCategoryItems? get defaultPreferenceValue =>
      defaultValue;
}
