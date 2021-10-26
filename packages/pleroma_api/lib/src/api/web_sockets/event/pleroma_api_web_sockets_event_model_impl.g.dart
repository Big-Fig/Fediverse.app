// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_web_sockets_event_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiWebSocketsEventAdapter
    extends TypeAdapter<PleromaApiWebSocketsEvent> {
  @override
  final int typeId = 0;

  @override
  PleromaApiWebSocketsEvent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiWebSocketsEvent(
      type: fields[0] as String,
      channel: fields[2] as PleromaApiWebSocketsChannel,
      status: fields[3] as PleromaApiStatus?,
      notification: fields[4] as PleromaApiNotification?,
      announcement: fields[5] as PleromaApiAnnouncement?,
      chat: fields[6] as PleromaApiChat?,
      conversation: fields[7] as PleromaApiConversation?,
      id: fields[8] as String?,
      followUpdate: fields[9] as PleromaApiAccountRelationshipFollowUpdate?,
      payload: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiWebSocketsEvent obj) {
    writer
      ..writeByte(10)
      ..writeByte(2)
      ..write(obj.channel)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.notification)
      ..writeByte(5)
      ..write(obj.announcement)
      ..writeByte(6)
      ..write(obj.chat)
      ..writeByte(7)
      ..write(obj.conversation)
      ..writeByte(9)
      ..write(obj.followUpdate)
      ..writeByte(8)
      ..write(obj.id)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(10)
      ..write(obj.payload);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiWebSocketsEventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PleromaApiWebSocketsRawEventAdapter
    extends TypeAdapter<PleromaApiWebSocketsRawEvent> {
  @override
  final int typeId = 0;

  @override
  PleromaApiWebSocketsRawEvent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiWebSocketsRawEvent(
      type: fields[0] as String,
      payload: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiWebSocketsRawEvent obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(10)
      ..write(obj.payload);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiWebSocketsRawEventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiWebSocketsEvent _$$_PleromaApiWebSocketsEventFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiWebSocketsEvent(
      type: json['event'] as String,
      channel: PleromaApiWebSocketsChannel.fromJson(
          json['channel'] as Map<String, dynamic>),
      status: json['status'] == null
          ? null
          : PleromaApiStatus.fromJson(json['status'] as Map<String, dynamic>),
      notification: json['notification'] == null
          ? null
          : PleromaApiNotification.fromJson(
              json['notification'] as Map<String, dynamic>),
      announcement: json['announcement'] == null
          ? null
          : PleromaApiAnnouncement.fromJson(
              json['announcement'] as Map<String, dynamic>),
      chat: json['chat'] == null
          ? null
          : PleromaApiChat.fromJson(json['chat'] as Map<String, dynamic>),
      conversation: json['conversation'] == null
          ? null
          : PleromaApiConversation.fromJson(
              json['conversation'] as Map<String, dynamic>),
      id: json['id'] as String?,
      followUpdate: json['follow_update'] == null
          ? null
          : PleromaApiAccountRelationshipFollowUpdate.fromJson(
              json['follow_update'] as Map<String, dynamic>),
      payload: json['payload'] as String?,
    );

Map<String, dynamic> _$$_PleromaApiWebSocketsEventToJson(
    _$_PleromaApiWebSocketsEvent instance) {
  final val = <String, dynamic>{
    'event': instance.type,
    'channel': instance.channel.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status?.toJson());
  writeNotNull('notification', instance.notification?.toJson());
  writeNotNull('announcement', instance.announcement?.toJson());
  writeNotNull('chat', instance.chat?.toJson());
  writeNotNull('conversation', instance.conversation?.toJson());
  writeNotNull('id', instance.id);
  writeNotNull('follow_update', instance.followUpdate?.toJson());
  writeNotNull('payload', instance.payload);
  return val;
}

_$_PleromaApiWebSocketsRawEvent _$$_PleromaApiWebSocketsRawEventFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiWebSocketsRawEvent(
      type: json['event'] as String,
      payload: json['payload'] as String?,
    );

Map<String, dynamic> _$$_PleromaApiWebSocketsRawEventToJson(
    _$_PleromaApiWebSocketsRawEvent instance) {
  final val = <String, dynamic>{
    'event': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('payload', instance.payload);
  return val;
}
