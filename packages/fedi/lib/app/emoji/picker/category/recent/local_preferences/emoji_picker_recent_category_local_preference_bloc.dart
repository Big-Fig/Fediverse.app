import 'package:fedi/app/emoji/picker/category/recent/emoji_picker_recent_category_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEmojiPickerRecentCategoryLocalPreferenceBloc
    implements LocalPreferenceBloc<EmojiPickerRecentCategoryItemsList?> {
  static IEmojiPickerRecentCategoryLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IEmojiPickerRecentCategoryLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
