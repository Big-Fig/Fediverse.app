import 'package:fedi/emoji_picker/item/custom_emoji_picker_item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'custom_emoji_picker_code_item_model.freezed.dart';

// ignore_for_file: no-magic-number
part 'custom_emoji_picker_code_item_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 71)
@freezed
class CustomEmojiPickerCodeItem
    with _$CustomEmojiPickerCodeItem
    implements CustomEmojiPickerItem {
  const CustomEmojiPickerCodeItem._();

  const factory CustomEmojiPickerCodeItem({
    @HiveField(0) required String name,
    @HiveField(1) required String code,
  }) = _CustomEmojiPickerCodeItem;

  factory CustomEmojiPickerCodeItem.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CustomEmojiPickerCodeItemFromJson(json);
}
