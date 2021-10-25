// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_mention_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiMentionAdapter extends TypeAdapter<MastodonApiMention> {
  @override
  final int typeId = 0;

  @override
  MastodonApiMention read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiMention(
      acct: fields[0] as String,
      id: fields[1] as String,
      url: fields[2] as String,
      username: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiMention obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.acct)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.username);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiMentionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiMention _$$_MastodonApiMentionFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiMention(
      acct: json['acct'] as String,
      id: json['id'] as String,
      url: json['url'] as String,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$$_MastodonApiMentionToJson(
    _$_MastodonApiMention instance) {
  final val = <String, dynamic>{
    'acct': instance.acct,
    'id': instance.id,
    'url': instance.url,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('username', instance.username);
  return val;
}
