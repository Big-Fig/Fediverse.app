import 'package:fedi/app/emoji/picker/category/custom/emoji_picker_custom_image_url_category_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEmojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc
    implements LocalPreferenceBloc<EmojiPickerCustomImageUrlCategoryItems?> {
  static IEmojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IEmojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
