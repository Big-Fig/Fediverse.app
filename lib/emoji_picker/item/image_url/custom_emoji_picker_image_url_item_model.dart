import 'dart:convert';

import 'package:fedi/emoji_picker/item/custom_emoji_picker_item_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'custom_emoji_picker_image_url_item_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 69)
@JsonSerializable(explicitToJson: true)
class CustomEmojiPickerImageUrlItem extends CustomEmojiPickerItem {
  @override
  @HiveField(0)
  final String name;
  @HiveField(1)
  @JsonKey(name: "image_url")
  final String imageUrl;

  CustomEmojiPickerImageUrlItem({
    required this.imageUrl,
    required this.name,
  });

  @override
  String get code => ":$name:";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomEmojiPickerImageUrlItem &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          imageUrl == other.imageUrl;

  @override
  int get hashCode => name.hashCode ^ imageUrl.hashCode;

  @override
  String toString() {
    return 'CustomEmojiPickerImageUrlItem{name: $name, imageUrl: $imageUrl}';
  }

  factory CustomEmojiPickerImageUrlItem.fromJson(Map<String, dynamic> json) =>
      _$CustomEmojiPickerImageUrlItemFromJson(json);

  factory CustomEmojiPickerImageUrlItem.fromJsonString(String jsonString) =>
      _$CustomEmojiPickerImageUrlItemFromJson(jsonDecode(jsonString));

  static List<CustomEmojiPickerImageUrlItem> listFromJsonString(String str) =>
      List<CustomEmojiPickerImageUrlItem>.from(
        json.decode(str).map((x) => CustomEmojiPickerImageUrlItem.fromJson(x)),
      );

  Map<String, dynamic> toJson() => _$CustomEmojiPickerImageUrlItemToJson(this);

  String toJsonString() =>
      jsonEncode(_$CustomEmojiPickerImageUrlItemToJson(this));
}
