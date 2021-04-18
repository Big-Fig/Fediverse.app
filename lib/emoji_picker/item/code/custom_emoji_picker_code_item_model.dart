import 'dart:convert';

import 'package:fedi/emoji_picker/item/custom_emoji_picker_item_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'custom_emoji_picker_code_item_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 71)
@JsonSerializable(explicitToJson: true)
class CustomEmojiPickerCodeItem extends CustomEmojiPickerItem {
  @override
  @HiveField(0)
  final String name;
  @override
  @HiveField(1)
  final String code;

  CustomEmojiPickerCodeItem({
    required this.code,
    required this.name,
  });

  @override
  String toString() {
    return 'CustomEmojiPickerCodeItem{'
        'name: $name, '
        'code: $code'
        '}';
  }

  factory CustomEmojiPickerCodeItem.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CustomEmojiPickerCodeItemFromJson(json);

  factory CustomEmojiPickerCodeItem.fromJsonString(String jsonString) =>
      _$CustomEmojiPickerCodeItemFromJson(jsonDecode(jsonString));

  static List<CustomEmojiPickerCodeItem> listFromJsonString(String str) =>
      List<CustomEmojiPickerCodeItem>.from(
        json.decode(str).map((x) => CustomEmojiPickerCodeItem.fromJson(x)),
      );

  Map<String, dynamic> toJson() => _$CustomEmojiPickerCodeItemToJson(this);

  String toJsonString() => jsonEncode(_$CustomEmojiPickerCodeItemToJson(this));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomEmojiPickerCodeItem &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          code == other.code;

  @override
  int get hashCode => name.hashCode ^ code.hashCode;
}
