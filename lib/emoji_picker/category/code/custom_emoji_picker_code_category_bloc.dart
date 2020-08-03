import 'package:fedi/emoji_picker/category/code/custom_emoji_picker_code_category_model.dart';
import 'package:fedi/emoji_picker/category/custom_emoji_picker_category_bloc.dart';
import 'package:fedi/emoji_picker/item/code/custom_emoji_picker_code_item_model.dart';

abstract class ICustomEmojiPickerCodeCategoryBloc
    implements ICustomEmojiPickerCategoryBloc {
  CustomEmojiPickerCodeCategoryType get type;

  @override
  List<CustomEmojiPickerCodeItem> get items;
}
