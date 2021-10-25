// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_card_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiCardAdapter extends TypeAdapter<MastodonApiCard> {
  @override
  final int typeId = 0;

  @override
  MastodonApiCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiCard(
      authorName: fields[0] as String?,
      authorUrl: fields[1] as String?,
      description: fields[2] as String?,
      embedUrl: fields[3] as String?,
      height: fields[4] as int?,
      width: fields[5] as int?,
      html: fields[6] as String?,
      image: fields[7] as String?,
      providerName: fields[8] as String?,
      providerUrl: fields[9] as String?,
      title: fields[10] as String?,
      type: fields[11] as String,
      url: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiCard obj) {
    writer
      ..writeByte(13)
      ..writeByte(12)
      ..write(obj.url)
      ..writeByte(10)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(11)
      ..write(obj.type)
      ..writeByte(0)
      ..write(obj.authorName)
      ..writeByte(1)
      ..write(obj.authorUrl)
      ..writeByte(8)
      ..write(obj.providerName)
      ..writeByte(9)
      ..write(obj.providerUrl)
      ..writeByte(6)
      ..write(obj.html)
      ..writeByte(5)
      ..write(obj.width)
      ..writeByte(4)
      ..write(obj.height)
      ..writeByte(7)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.embedUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiCard _$$_MastodonApiCardFromJson(Map<String, dynamic> json) =>
    _$_MastodonApiCard(
      authorName: json['author_name'] as String?,
      authorUrl: json['author_url'] as String?,
      description: json['description'] as String?,
      embedUrl: json['embed_url'] as String?,
      height: JsonParseHelper.intFromJsonOrNullOnError(json['height']),
      width: JsonParseHelper.intFromJsonOrNullOnError(json['width']),
      html: json['html'] as String?,
      image: json['image'] as String?,
      providerName: json['provider_name'] as String?,
      providerUrl: json['provider_url'] as String?,
      title: json['title'] as String?,
      type: json['type'] as String,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_MastodonApiCardToJson(_$_MastodonApiCard instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('author_name', instance.authorName);
  writeNotNull('author_url', instance.authorUrl);
  writeNotNull('description', instance.description);
  writeNotNull('embed_url', instance.embedUrl);
  writeNotNull('height', instance.height);
  writeNotNull('width', instance.width);
  writeNotNull('html', instance.html);
  writeNotNull('image', instance.image);
  writeNotNull('provider_name', instance.providerName);
  writeNotNull('provider_url', instance.providerUrl);
  writeNotNull('title', instance.title);
  val['type'] = instance.type;
  writeNotNull('url', instance.url);
  return val;
}
