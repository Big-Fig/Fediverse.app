// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Source.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonSourceAdapter extends TypeAdapter<MastodonSource> {
  @override
  MastodonSource read(BinaryReader reader) {
    var obj = MastodonSource();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 1:
          obj.privacy = reader.read() as String;
          break;
        case 2:
          obj.sensitive = reader.read() as bool;
          break;
        case 3:
          obj.language = reader.read() as String;
          break;
        case 4:
          obj.note = reader.read() as String;
          break;
        case 5:
          obj.fields = (reader.read() as List)?.cast<Field>();
          break;
        case 6:
          obj.followRequestsCount = reader.read() as int;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, MastodonSource obj) {
    writer.writeByte(6);
    writer.writeByte(1);
    writer.write(obj.privacy);
    writer.writeByte(2);
    writer.write(obj.sensitive);
    writer.writeByte(3);
    writer.write(obj.language);
    writer.writeByte(4);
    writer.write(obj.note);
    writer.writeByte(5);
    writer.write(obj.fields);
    writer.writeByte(6);
    writer.write(obj.followRequestsCount);
  }
}

class SourcePleromaAdapter extends TypeAdapter<SourcePleroma> {
  @override
  SourcePleroma read(BinaryReader reader) {
    var obj = SourcePleroma();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 1:
          obj.showRole = reader.read() as bool;
          break;
        case 2:
          obj.noRichText = reader.read() as bool;
          break;
        case 3:
          obj.discoverable = reader.read() as bool;
          break;
        case 4:
          obj.actorType = reader.read() as String;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, SourcePleroma obj) {
    writer.writeByte(4);
    writer.writeByte(1);
    writer.write(obj.showRole);
    writer.writeByte(2);
    writer.write(obj.noRichText);
    writer.writeByte(3);
    writer.write(obj.discoverable);
    writer.writeByte(4);
    writer.write(obj.actorType);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MastodonSource _$MastodonSourceFromJson(Map<String, dynamic> json) {
  return MastodonSource(
    privacy: json['privacy'] as String,
    sensitive: json['sensitive'] as bool,
    language: json['language'] as String,
    note: json['note'] as String,
    fields: (json['fields'] as List)
        ?.map(
            (e) => e == null ? null : Field.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    followRequestsCount: json['follow_requests_count'] as int,
  );
}

Map<String, dynamic> _$MastodonSourceToJson(MastodonSource instance) =>
    <String, dynamic>{
      'privacy': instance.privacy,
      'sensitive': instance.sensitive,
      'language': instance.language,
      'note': instance.note,
      'fields': instance.fields,
      'follow_requests_count': instance.followRequestsCount,
    };

Source _$SourceFromJson(Map<String, dynamic> json) {
  return Source(
    privacy: json['privacy'] as String,
    sensitive: json['sensitive'] as bool,
    language: json['language'] as String,
    note: json['note'] as String,
    fields: (json['fields'] as List)
        ?.map(
            (e) => e == null ? null : Field.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    followRequestsCount: json['follow_requests_count'] as int,
    pleroma: json['pleroma'] == null
        ? null
        : SourcePleroma.fromJson(json['pleroma'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'privacy': instance.privacy,
      'sensitive': instance.sensitive,
      'language': instance.language,
      'note': instance.note,
      'fields': instance.fields,
      'follow_requests_count': instance.followRequestsCount,
      'pleroma': instance.pleroma,
    };

SourcePleroma _$SourcePleromaFromJson(Map<String, dynamic> json) {
  return SourcePleroma(
    showRole: json['show_role'] as bool,
    noRichText: json['no_rich_text'] as bool,
    discoverable: json['discoverable'] as bool,
    actorType: json['actor_type'] as String,
  );
}

Map<String, dynamic> _$SourcePleromaToJson(SourcePleroma instance) =>
    <String, dynamic>{
      'show_role': instance.showRole,
      'no_rich_text': instance.noRichText,
      'discoverable': instance.discoverable,
      'actor_type': instance.actorType,
    };
