
import 'package:fedi/emoji_picker/category/recent/custom_emoji_picker_recent_category_bloc.dart';
import 'package:fedi/emoji_picker/category/recent/custom_emoji_picker_recent_category_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class CustomEmojiPickerRecentCategoryLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<CustomEmojiPickerRecentCategoryItemsList>
    implements ICustomEmojiPickerRecentCategoryLocalPreferenceBloc {
  CustomEmojiPickerRecentCategoryLocalPreferenceBloc(
      String userAtHost, ILocalPreferencesService preferencesService)
      : super(preferencesService, "$userAtHost.emoji.recent", 1);
}
