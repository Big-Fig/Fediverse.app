// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_emoji_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaEmojiAdapter extends TypeAdapter<PleromaEmoji> {
  @override
  PleromaEmoji read(BinaryReader reader) {
    var obj = PleromaEmoji();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.shortcode = reader.read() as String;
          break;
        case 1:
          obj.url = reader.read() as String;
          break;
        case 2:
          obj.staticUrl = reader.read() as String;
          break;
        case 3:
          obj.visibleInPicker = reader.read() as bool;
          break;
        case 4:
          obj.category = reader.read() as String;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, PleromaEmoji obj) {
    writer.writeByte(5);
    writer.writeByte(0);
    writer.write(obj.shortcode);
    writer.writeByte(1);
    writer.write(obj.url);
    writer.writeByte(2);
    writer.write(obj.staticUrl);
    writer.writeByte(3);
    writer.write(obj.visibleInPicker);
    writer.writeByte(4);
    writer.write(obj.category);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaEmoji _$PleromaEmojiFromJson(Map<String, dynamic> json) {
  return PleromaEmoji(
    shortcode: json['shortcode'] as String,
    url: json['url'] as String,
    staticUrl: json['static_url'] as String,
    visibleInPicker: json['visible_in_picker'] as bool,
  )..category = json['category'] as String;
}

Map<String, dynamic> _$PleromaEmojiToJson(PleromaEmoji instance) =>
    <String, dynamic>{
      'shortcode': instance.shortcode,
      'url': instance.url,
      'static_url': instance.staticUrl,
      'visible_in_picker': instance.visibleInPicker,
      'category': instance.category,
    };

PleromaEmojiReactions _$PleromaEmojiReactionsFromJson(
    Map<String, dynamic> json) {
  return PleromaEmojiReactions(
    name: json['name'] as String,
    count: json['count'] as int,
    me: json['me'] as bool,
  );
}

Map<String, dynamic> _$PleromaEmojiReactionsToJson(
        PleromaEmojiReactions instance) =>
    <String, dynamic>{
      'name': instance.name,
      'count': instance.count,
      'me': instance.me,
    };
