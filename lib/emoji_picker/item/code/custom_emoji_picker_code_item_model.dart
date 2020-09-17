import 'package:fedi/emoji_picker/item/custom_emoji_picker_item_model.dart';
import 'package:hive/hive.dart';

part 'custom_emoji_picker_code_item_model.g.dart';

@HiveType(typeId: -32 + 71)
class CustomEmojiPickerCodeItem extends CustomEmojiPickerItem {
  @override
  @HiveField(0)
  String name;
  @override
  @HiveField(1)
  String code;
  CustomEmojiPickerCodeItem({
    this.code,
    this.name,
  });
}
