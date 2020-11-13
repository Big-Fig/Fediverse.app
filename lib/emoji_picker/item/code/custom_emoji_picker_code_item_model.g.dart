// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_emoji_picker_code_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomEmojiPickerCodeItemAdapter
    extends TypeAdapter<CustomEmojiPickerCodeItem> {
  @override
  final int typeId = 39;

  @override
  CustomEmojiPickerCodeItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomEmojiPickerCodeItem(
      code: fields[1] as String,
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CustomEmojiPickerCodeItem obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.code);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomEmojiPickerCodeItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomEmojiPickerCodeItem _$CustomEmojiPickerCodeItemFromJson(
    Map<String, dynamic> json) {
  return CustomEmojiPickerCodeItem(
    code: json['code'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$CustomEmojiPickerCodeItemToJson(
        CustomEmojiPickerCodeItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };
