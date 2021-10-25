// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_scheduled_status_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiScheduledStatusAdapter
    extends TypeAdapter<MastodonApiScheduledStatus> {
  @override
  final int typeId = 0;

  @override
  MastodonApiScheduledStatus read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiScheduledStatus(
      id: fields[0] as String,
      mediaAttachments:
          (fields[1] as List?)?.cast<MastodonApiMediaAttachment>(),
      params: fields[2] as MastodonApiScheduledStatusParams,
      scheduledAt: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiScheduledStatus obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.scheduledAt)
      ..writeByte(2)
      ..write(obj.params)
      ..writeByte(1)
      ..write(obj.mediaAttachments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiScheduledStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiScheduledStatus _$$_MastodonApiScheduledStatusFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiScheduledStatus(
      id: json['id'] as String,
      mediaAttachments: (json['media_attachments'] as List<dynamic>?)
          ?.map((e) =>
              MastodonApiMediaAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      params: MastodonApiScheduledStatusParams.fromJson(
          json['params'] as Map<String, dynamic>),
      scheduledAt: DateTime.parse(json['scheduled_at'] as String),
    );

Map<String, dynamic> _$$_MastodonApiScheduledStatusToJson(
    _$_MastodonApiScheduledStatus instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('media_attachments',
      instance.mediaAttachments?.map((e) => e.toJson()).toList());
  val['params'] = instance.params.toJson();
  val['scheduled_at'] = instance.scheduledAt.toIso8601String();
  return val;
}
