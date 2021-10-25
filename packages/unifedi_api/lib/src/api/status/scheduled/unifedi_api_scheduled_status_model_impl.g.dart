// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_scheduled_status_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiScheduledStatusAdapter
    extends TypeAdapter<UnifediApiScheduledStatus> {
  @override
  final int typeId = 0;

  @override
  UnifediApiScheduledStatus read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiScheduledStatus(
      id: fields[0] as String,
      mediaAttachments: (fields[1] as List?)?.cast<UnifediApiMediaAttachment>(),
      params: fields[2] as UnifediApiScheduledStatusParams,
      scheduledAt: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiScheduledStatus obj) {
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
      other is UnifediApiScheduledStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiScheduledStatus _$$_UnifediApiScheduledStatusFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiScheduledStatus(
      id: json['id'] as String,
      mediaAttachments: (json['media_attachments'] as List<dynamic>?)
          ?.map((e) =>
              UnifediApiMediaAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      params: UnifediApiScheduledStatusParams.fromJson(
          json['params'] as Map<String, dynamic>),
      scheduledAt: DateTime.parse(json['scheduled_at'] as String),
    );

Map<String, dynamic> _$$_UnifediApiScheduledStatusToJson(
    _$_UnifediApiScheduledStatus instance) {
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
