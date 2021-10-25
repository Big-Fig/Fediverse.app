// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_push_payload_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiPushPayloadAdapter
    extends TypeAdapter<MastodonApiPushPayload> {
  @override
  final int typeId = 0;

  @override
  MastodonApiPushPayload read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiPushPayload(
      notificationId: fields[0] as String,
      notificationType: fields[1] as String,
      title: fields[2] as String?,
      body: fields[3] as String?,
      icon: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiPushPayload obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.notificationId)
      ..writeByte(1)
      ..write(obj.notificationType)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.body)
      ..writeByte(4)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiPushPayloadAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiPushPayload _$$_MastodonApiPushPayloadFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiPushPayload(
      notificationId: json['notification_id'] as String,
      notificationType: json['notification_type'] as String,
      title: json['title'] as String?,
      body: json['body'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$_MastodonApiPushPayloadToJson(
    _$_MastodonApiPushPayload instance) {
  final val = <String, dynamic>{
    'notification_id': instance.notificationId,
    'notification_type': instance.notificationType,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('body', instance.body);
  writeNotNull('icon', instance.icon);
  return val;
}
