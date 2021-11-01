// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fedi_push_notification_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FediPushNotificationAdapter extends TypeAdapter<FediPushNotification> {
  @override
  final int typeId = 86;

  @override
  FediPushNotification read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FediPushNotification(
      account: fields[0] as String,
      notificationAction: fields[1] as String?,
      notificationActionInput: fields[2] as String?,
      notificationId: fields[3] as String,
      notificationType: fields[4] as String,
      server: fields[5] as String,
      unifediApiNotification: fields[6] as UnifediApiNotification?,
    );
  }

  @override
  void write(BinaryWriter writer, FediPushNotification obj) {
    writer
      ..writeByte(7)
      ..writeByte(3)
      ..write(obj.notificationId)
      ..writeByte(5)
      ..write(obj.server)
      ..writeByte(0)
      ..write(obj.account)
      ..writeByte(4)
      ..write(obj.notificationType)
      ..writeByte(6)
      ..write(obj.unifediApiNotification)
      ..writeByte(1)
      ..write(obj.notificationAction)
      ..writeByte(2)
      ..write(obj.notificationActionInput);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FediPushNotificationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FediPushNotification _$$_FediPushNotificationFromJson(
        Map<String, dynamic> json) =>
    _$_FediPushNotification(
      account: json['account'] as String,
      notificationAction: json['notification_action'] as String?,
      notificationActionInput: json['notification_action_input'] as String?,
      notificationId: json['notification_id'] as String,
      notificationType: json['notification_type'] as String,
      server: json['server'] as String,
      unifediApiNotification: json['notification'] == null
          ? null
          : UnifediApiNotification.fromJson(
              json['notification'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FediPushNotificationToJson(
    _$_FediPushNotification instance) {
  final val = <String, dynamic>{
    'account': instance.account,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('notification_action', instance.notificationAction);
  writeNotNull('notification_action_input', instance.notificationActionInput);
  val['notification_id'] = instance.notificationId;
  val['notification_type'] = instance.notificationType;
  val['server'] = instance.server;
  writeNotNull('notification', instance.unifediApiNotification?.toJson());
  return val;
}
