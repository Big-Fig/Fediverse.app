import 'package:fedi/emoji_picker/item/custom_emoji_picker_item_model.dart';
import 'package:hive/hive.dart';

part 'custom_emoji_picker_image_url_item_model.g.dart';

@HiveType()
class CustomEmojiPickerImageUrlItem extends CustomEmojiPickerItem {
  @override
  @HiveField(0)
  String name;
  @HiveField(1)
  String imageUrl;
  CustomEmojiPickerImageUrlItem({
    this.imageUrl,
    this.name,
  });

  @override
  String get code => ":$name:";
}
