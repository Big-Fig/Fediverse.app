// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_notification_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiNotificationPleromaPartAdapter
    extends TypeAdapter<PleromaApiNotificationPleromaPart> {
  @override
  final int typeId = 0;

  @override
  PleromaApiNotificationPleromaPart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiNotificationPleromaPart(
      isSeen: fields[0] as bool?,
      isMuted: fields[1] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiNotificationPleromaPart obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.isSeen)
      ..writeByte(1)
      ..write(obj.isMuted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiNotificationPleromaPartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PleromaApiNotificationAdapter
    extends TypeAdapter<PleromaApiNotification> {
  @override
  final int typeId = 0;

  @override
  PleromaApiNotification read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiNotification(
      account: fields[0] as PleromaApiAccount?,
      target: fields[1] as PleromaApiAccount?,
      createdAt: fields[2] as DateTime,
      id: fields[3] as String,
      type: fields[4] as String,
      status: fields[5] as PleromaApiStatus?,
      emoji: fields[6] as String?,
      pleroma: fields[7] as PleromaApiNotificationPleromaPart?,
      chatMessage: fields[8] as PleromaApiChatMessage?,
      report: fields[9] as PleromaApiAccountReport?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiNotification obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.account)
      ..writeByte(1)
      ..write(obj.target)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(8)
      ..write(obj.chatMessage)
      ..writeByte(6)
      ..write(obj.emoji)
      ..writeByte(7)
      ..write(obj.pleroma)
      ..writeByte(9)
      ..write(obj.report)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiNotificationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiNotificationPleromaPart
    _$$_PleromaApiNotificationPleromaPartFromJson(Map<String, dynamic> json) =>
        _$_PleromaApiNotificationPleromaPart(
          isSeen: json['is_seen'] as bool?,
          isMuted: json['is_muted'] as bool?,
        );

Map<String, dynamic> _$$_PleromaApiNotificationPleromaPartToJson(
    _$_PleromaApiNotificationPleromaPart instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('is_seen', instance.isSeen);
  writeNotNull('is_muted', instance.isMuted);
  return val;
}

_$_PleromaApiNotification _$$_PleromaApiNotificationFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiNotification(
      account: json['account'] == null
          ? null
          : PleromaApiAccount.fromJson(json['account'] as Map<String, dynamic>),
      target: json['target'] == null
          ? null
          : PleromaApiAccount.fromJson(json['target'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      id: json['id'] as String,
      type: json['type'] as String,
      status: json['status'] == null
          ? null
          : PleromaApiStatus.fromJson(json['status'] as Map<String, dynamic>),
      emoji: json['emoji'] as String?,
      pleroma: json['pleroma'] == null
          ? null
          : PleromaApiNotificationPleromaPart.fromJson(
              json['pleroma'] as Map<String, dynamic>),
      chatMessage: json['chat_message'] == null
          ? null
          : PleromaApiChatMessage.fromJson(
              json['chat_message'] as Map<String, dynamic>),
      report: json['report'] == null
          ? null
          : PleromaApiAccountReport.fromJson(
              json['report'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PleromaApiNotificationToJson(
    _$_PleromaApiNotification instance) {
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
  writeNotNull('pleroma', instance.pleroma?.toJson());
  writeNotNull('chat_message', instance.chatMessage?.toJson());
  writeNotNull('report', instance.report?.toJson());
  return val;
}
