// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_notification_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiNotificationAdapter
    extends TypeAdapter<UnifediApiNotification> {
  @override
  final int typeId = 0;

  @override
  UnifediApiNotification read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiNotification(
      account: fields[0] as UnifediApiAccount?,
      target: fields[1] as UnifediApiAccount?,
      createdAt: fields[2] as DateTime,
      id: fields[3] as String,
      type: fields[4] as String,
      status: fields[5] as UnifediApiStatus?,
      emoji: fields[6] as String?,
      chatMessage: fields[8] as UnifediApiChatMessage?,
      report: fields[9] as UnifediApiAccountReport?,
      isSeen: fields[10] as bool?,
      isMuted: fields[12] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiNotification obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.account)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.target)
      ..writeByte(8)
      ..write(obj.chatMessage)
      ..writeByte(6)
      ..write(obj.emoji)
      ..writeByte(9)
      ..write(obj.report)
      ..writeByte(10)
      ..write(obj.isSeen)
      ..writeByte(12)
      ..write(obj.isMuted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiNotificationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiNotification _$$_UnifediApiNotificationFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiNotification(
      account: json['account'] == null
          ? null
          : UnifediApiAccount.fromJson(json['account'] as Map<String, dynamic>),
      target: json['target'] == null
          ? null
          : UnifediApiAccount.fromJson(json['target'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      id: json['id'] as String,
      type: json['type'] as String,
      status: json['status'] == null
          ? null
          : UnifediApiStatus.fromJson(json['status'] as Map<String, dynamic>),
      emoji: json['emoji'] as String?,
      chatMessage: json['chat_message'] == null
          ? null
          : UnifediApiChatMessage.fromJson(
              json['chat_message'] as Map<String, dynamic>),
      report: json['report'] == null
          ? null
          : UnifediApiAccountReport.fromJson(
              json['report'] as Map<String, dynamic>),
      isSeen: json['is_seen'] as bool?,
      isMuted: json['is_muted'] as bool?,
    );

Map<String, dynamic> _$$_UnifediApiNotificationToJson(
    _$_UnifediApiNotification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('account', instance.account?.toJson());
  writeNotNull('target', instance.target?.toJson());
  val['created_at'] = instance.createdAt.toIso8601String();
  val['id'] = instance.id;
  val['type'] = instance.type;
  writeNotNull('status', instance.status?.toJson());
  writeNotNull('emoji', instance.emoji);
  writeNotNull('chat_message', instance.chatMessage?.toJson());
  writeNotNull('report', instance.report?.toJson());
  writeNotNull('is_seen', instance.isSeen);
  writeNotNull('is_muted', instance.isMuted);
  return val;
}
