import 'package:fedi/emoji_picker/category/custom_emoji_picker_category_bloc.dart';
import 'package:fedi/emoji_picker/item/image_url/custom_emoji_picker_image_url_item_model.dart';

abstract class ICustomEmojiPickerImageUrlCategoryBloc
    extends ICustomEmojiPickerCategoryBloc {
  @override
  final List<CustomEmojiPickerImageUrlItem> items;

  ICustomEmojiPickerImageUrlCategoryBloc({
    required this.items,
  });
}
