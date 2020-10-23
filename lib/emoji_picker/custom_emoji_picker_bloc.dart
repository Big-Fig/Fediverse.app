import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/emoji_picker/category/custom_emoji_picker_category_bloc.dart';
import 'package:fedi/emoji_picker/item/custom_emoji_picker_item_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICustomEmojiPickerBloc implements IDisposable {
  static ICustomEmojiPickerBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ICustomEmojiPickerBloc>(context, listen: listen);

  List<ICustomEmojiPickerCategoryBloc> get availableCategories;

  Stream<List<ICustomEmojiPickerCategoryBloc>> get availableCategoriesStream;

  ICustomEmojiPickerCategoryBloc get selectedCategoryBloc;

  Stream<ICustomEmojiPickerCategoryBloc> get selectedCategoryBlocStream;

  Stream<CustomEmojiPickerItem> get selectedEmojiStream;

  void selectCategory(ICustomEmojiPickerCategoryBloc category);
  void onEmojiSelected(CustomEmojiPickerItem emojiItem);
}
