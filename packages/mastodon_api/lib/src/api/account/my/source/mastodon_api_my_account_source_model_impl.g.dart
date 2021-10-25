// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_my_account_source_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiMyAccountSourceAdapter
    extends TypeAdapter<MastodonApiMyAccountSource> {
  @override
  final int typeId = 0;

  @override
  MastodonApiMyAccountSource read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiMyAccountSource(
      privacy: fields[1] as String?,
      sensitive: fields[2] as bool?,
      language: fields[3] as String?,
      note: fields[4] as String?,
      fields: (fields[5] as List?)?.cast<MastodonApiField>(),
      followRequestsCount: fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiMyAccountSource obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.privacy)
      ..writeByte(2)
      ..write(obj.sensitive)
      ..writeByte(3)
      ..write(obj.language)
      ..writeByte(4)
      ..write(obj.note)
      ..writeByte(5)
      ..write(obj.fields)
      ..writeByte(6)
      ..write(obj.followRequestsCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiMyAccountSourceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_mastodonApiMyAccountSource _$$_mastodonApiMyAccountSourceFromJson(
        Map<String, dynamic> json) =>
    _$_mastodonApiMyAccountSource(
      privacy: json['privacy'] as String?,
      sensitive: json['sensitive'] as bool?,
      language: json['language'] as String?,
      note: json['note'] as String?,
      fields: (json['fields'] as List<dynamic>?)
          ?.map((e) => MastodonApiField.fromJson(e as Map<String, dynamic>))
          .toList(),
      followRequestsCount: json['follow_requests_count'] as int?,
    );

Map<String, dynamic> _$$_mastodonApiMyAccountSourceToJson(
    _$_mastodonApiMyAccountSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('privacy', instance.privacy);
  writeNotNull('sensitive', instance.sensitive);
  writeNotNull('language', instance.language);
  writeNotNull('note', instance.note);
  writeNotNull('fields', instance.fields?.map((e) => e.toJson()).toList());
  writeNotNull('follow_requests_count', instance.followRequestsCount);
  return val;
}
