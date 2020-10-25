import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/emoji_picker/category/code/custom_emoji_picker_code_category_bloc.dart';
import 'package:fedi/emoji_picker/category/code/custom_emoji_picker_code_category_data.dart';
import 'package:fedi/emoji_picker/category/code/custom_emoji_picker_code_category_model.dart';
import 'package:fedi/emoji_picker/item/code/custom_emoji_picker_code_item_model.dart';
import 'package:fedi/emoji_picker/item/custom_emoji_picker_item_model.dart';
import 'package:flutter/widgets.dart';

class CustomEmojiPickerCodeCategoryBloc extends AsyncInitLoadingBloc
    implements ICustomEmojiPickerCodeCategoryBloc {
  @override
  final CustomEmojiPickerCodeCategoryType type;

  static final CustomEmojiPickerCodeCategoryBloc smiles =
      createCodeCategoryFromMap(
    CustomEmojiPickerCodeCategoryType.smiles,
    CustomEmojiPickerCodeCategoryData.smiles,
  );
  static final CustomEmojiPickerCodeCategoryBloc animals =
      createCodeCategoryFromMap(
    CustomEmojiPickerCodeCategoryType.animals,
    CustomEmojiPickerCodeCategoryData.animals,
  );
  static final CustomEmojiPickerCodeCategoryBloc foods =
      createCodeCategoryFromMap(
    CustomEmojiPickerCodeCategoryType.foods,
    CustomEmojiPickerCodeCategoryData.foods,
  );
  static final CustomEmojiPickerCodeCategoryBloc travel =
      createCodeCategoryFromMap(
    CustomEmojiPickerCodeCategoryType.travel,
    CustomEmojiPickerCodeCategoryData.travel,
  );
  static final CustomEmojiPickerCodeCategoryBloc activities =
      createCodeCategoryFromMap(
    CustomEmojiPickerCodeCategoryType.activities,
    CustomEmojiPickerCodeCategoryData.activities,
  );
  static final CustomEmojiPickerCodeCategoryBloc objects =
      createCodeCategoryFromMap(
    CustomEmojiPickerCodeCategoryType.objects,
    CustomEmojiPickerCodeCategoryData.objects,
  );
  static final CustomEmojiPickerCodeCategoryBloc symbols =
      createCodeCategoryFromMap(
    CustomEmojiPickerCodeCategoryType.symbols,
    CustomEmojiPickerCodeCategoryData.symbols,
  );
  static final CustomEmojiPickerCodeCategoryBloc flags =
      createCodeCategoryFromMap(
    CustomEmojiPickerCodeCategoryType.flags,
    CustomEmojiPickerCodeCategoryData.flags,
  );

  static final List<CustomEmojiPickerCodeCategoryBloc> allCategories = [
    smiles,
    animals,
    foods,
    travel,
    activities,
    objects,
    symbols,
    flags
  ];

  @override
  final List<CustomEmojiPickerCodeItem> items;
  CustomEmojiPickerCodeCategoryBloc({
    @required this.type,
    @required this.items,
  });

  static CustomEmojiPickerCodeCategoryBloc createCodeCategoryFromMap(
      CustomEmojiPickerCodeCategoryType type,
      Map<String, String> nameToCodeEmojiMap) {
    return CustomEmojiPickerCodeCategoryBloc(
        type: type,
        items: nameToCodeEmojiMap.entries
            .map((entry) =>
                CustomEmojiPickerCodeItem(name: entry.key, code: entry.value))
            .toList());
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomEmojiPickerCodeCategoryBloc &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          items == other.items;
  @override
  int get hashCode => type.hashCode ^ items.hashCode;
  @override
  String toString() {
    return 'CustomEmojiPickerCodeCategory{type: $type, items: $items}';
  }

  @override
  Future internalAsyncInit() async {
    // nothing
  }

  @override
  Stream<List<CustomEmojiPickerItem>> get itemsStream => Stream.value(items);
}
