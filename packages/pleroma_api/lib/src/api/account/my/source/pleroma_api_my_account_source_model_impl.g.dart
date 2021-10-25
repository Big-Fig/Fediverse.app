// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_my_account_source_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiMyAccountSourceAdapter
    extends TypeAdapter<PleromaApiMyAccountSource> {
  @override
  final int typeId = 0;

  @override
  PleromaApiMyAccountSource read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiMyAccountSource(
      privacy: fields[1] as String?,
      sensitive: fields[2] as bool?,
      language: fields[3] as String?,
      note: fields[4] as String?,
      fields: (fields[5] as List?)?.cast<PleromaApiField>(),
      followRequestsCount: fields[6] as int?,
      pleroma: fields[7] as PleromaApiMyAccountSourcePleromaPart?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiMyAccountSource obj) {
    writer
      ..writeByte(7)
      ..writeByte(5)
      ..write(obj.fields)
      ..writeByte(7)
      ..write(obj.pleroma)
      ..writeByte(1)
      ..write(obj.privacy)
      ..writeByte(2)
      ..write(obj.sensitive)
      ..writeByte(3)
      ..write(obj.language)
      ..writeByte(4)
      ..write(obj.note)
      ..writeByte(6)
      ..write(obj.followRequestsCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiMyAccountSourceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PleromaApiMyAccountSourcePleromaPartAdapter
    extends TypeAdapter<PleromaApiMyAccountSourcePleromaPart> {
  @override
  final int typeId = 0;

  @override
  PleromaApiMyAccountSourcePleromaPart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiMyAccountSourcePleromaPart(
      showRole: fields[1] as bool?,
      noRichText: fields[2] as bool?,
      discoverable: fields[3] as bool?,
      actorType: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiMyAccountSourcePleromaPart obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.showRole)
      ..writeByte(2)
      ..write(obj.noRichText)
      ..writeByte(3)
      ..write(obj.discoverable)
      ..writeByte(4)
      ..write(obj.actorType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiMyAccountSourcePleromaPartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiMyAccountSource _$$_PleromaApiMyAccountSourceFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiMyAccountSource(
      privacy: json['privacy'] as String?,
      sensitive: json['sensitive'] as bool?,
      language: json['language'] as String?,
      note: json['note'] as String?,
      fields: (json['fields'] as List<dynamic>?)
          ?.map((e) => PleromaApiField.fromJson(e as Map<String, dynamic>))
          .toList(),
      followRequestsCount: json['follow_requests_count'] as int?,
      pleroma: json['pleroma'] == null
          ? null
          : PleromaApiMyAccountSourcePleromaPart.fromJson(
              json['pleroma'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PleromaApiMyAccountSourceToJson(
    _$_PleromaApiMyAccountSource instance) {
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
  writeNotNull('pleroma', instance.pleroma?.toJson());
  return val;
}

_$_PleromaApiMyAccountSourcePleromaPart
    _$$_PleromaApiMyAccountSourcePleromaPartFromJson(
            Map<String, dynamic> json) =>
        _$_PleromaApiMyAccountSourcePleromaPart(
          showRole: json['show_role'] as bool?,
          noRichText: json['no_rich_text'] as bool?,
          discoverable: json['discoverable'] as bool?,
          actorType: json['actor_type'] as String?,
        );

Map<String, dynamic> _$$_PleromaApiMyAccountSourcePleromaPartToJson(
    _$_PleromaApiMyAccountSourcePleromaPart instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('show_role', instance.showRole);
  writeNotNull('no_rich_text', instance.noRichText);
  writeNotNull('discoverable', instance.discoverable);
  writeNotNull('actor_type', instance.actorType);
  return val;
}
