import 'package:fedi/emoji_picker/category/recent/custom_emoji_picker_recent_category_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICustomEmojiPickerRecentCategoryLocalPreferenceBloc
    implements LocalPreferenceBloc<CustomEmojiPickerRecentCategoryItemsList> {
  static ICustomEmojiPickerRecentCategoryLocalPreferenceBloc of(
          BuildContext context,
          {bool listen = true}) =>
      Provider.of<ICustomEmojiPickerRecentCategoryLocalPreferenceBloc>(context,
          listen: listen);
}
