// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Emoji.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmojiAdapter extends TypeAdapter<Emoji> {
  @override
  Emoji read(BinaryReader reader) {
    var obj = Emoji();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.shortcode = reader.read() as String;
          break;
        case 1:
          obj.url = reader.read() as String;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, Emoji obj) {
    writer.writeByte(2);
    writer.writeByte(0);
    writer.write(obj.shortcode);
    writer.writeByte(1);
    writer.write(obj.url);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Emoji _$EmojiFromJson(Map<String, dynamic> json) {
  return Emoji(
    shortcode: json['shortcode'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$EmojiToJson(Emoji instance) => <String, dynamic>{
      'shortcode': instance.shortcode,
      'url': instance.url,
    };
