import 'package:fedi/emoji_picker/item/custom_emoji_picker_item_model.dart';
import 'package:hive/hive.dart';

part 'custom_emoji_picker_image_url_item_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
@HiveType(typeId: -32 + 69)
class CustomEmojiPickerImageUrlItem extends CustomEmojiPickerItem {
  @override
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String imageUrl;
  CustomEmojiPickerImageUrlItem({
    this.imageUrl,
    this.name,
  });

  @override
  String get code => ":$name:";
}
