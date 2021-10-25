import 'package:fedi_app/emoji_picker/item/custom_emoji_picker_item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'custom_emoji_picker_image_url_item_model.freezed.dart';

// ignore_for_file: no-magic-number
part 'custom_emoji_picker_image_url_item_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 69)
@freezed
class CustomEmojiPickerImageUrlItem
    with _$CustomEmojiPickerImageUrlItem
    implements CustomEmojiPickerItem {
  const CustomEmojiPickerImageUrlItem._();

  const factory CustomEmojiPickerImageUrlItem({
    @HiveField(0) required String name,
    @HiveField(1) @JsonKey(name: 'image_url') required String imageUrl,
  }) = _CustomEmojiPickerImageUrlItem;

  @override
  String get code => ':$name:';

  factory CustomEmojiPickerImageUrlItem.fromJson(Map<String, dynamic> json) =>
      _$CustomEmojiPickerImageUrlItemFromJson(json);
}
