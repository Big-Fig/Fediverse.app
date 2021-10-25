// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_web_sockets_event_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiWebSocketsEventAdapter
    extends TypeAdapter<UnifediApiWebSocketsEvent> {
  @override
  final int typeId = 0;

  @override
  UnifediApiWebSocketsEvent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiWebSocketsEvent(
      type: fields[0] as String,
      channel: fields[2] as UnifediApiWebSocketsChannel,
      status: fields[3] as UnifediApiStatus?,
      notification: fields[4] as UnifediApiNotification?,
      announcement: fields[5] as UnifediApiAnnouncement?,
      chat: fields[6] as UnifediApiChat?,
      conversation: fields[7] as UnifediApiConversation?,
      id: fields[8] as String?,
      followUpdate: fields[9] as UnifediApiAccountRelationshipFollowUpdate?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiWebSocketsEvent obj) {
    writer
      ..writeByte(9)
      ..writeByte(2)
      ..write(obj.channel)
      ..writeByte(0)
      ..write(obj.type)
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
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiWebSocketsEventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiWebSocketsEvent _$$_UnifediApiWebSocketsEventFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiWebSocketsEvent(
      type: json['event'] as String,
      channel: UnifediApiWebSocketsChannel.fromJson(
          json['channel'] as Map<String, dynamic>),
      status: json['status'] == null
          ? null
          : UnifediApiStatus.fromJson(json['status'] as Map<String, dynamic>),
      notification: json['notification'] == null
          ? null
          : UnifediApiNotification.fromJson(
              json['notification'] as Map<String, dynamic>),
      announcement: json['announcement'] == null
          ? null
          : UnifediApiAnnouncement.fromJson(
              json['announcement'] as Map<String, dynamic>),
      chat: json['chat'] == null
          ? null
          : UnifediApiChat.fromJson(json['chat'] as Map<String, dynamic>),
      conversation: json['conversation'] == null
          ? null
          : UnifediApiConversation.fromJson(
              json['conversation'] as Map<String, dynamic>),
      id: json['id'] as String?,
      followUpdate: json['followUpdate'] == null
          ? null
          : UnifediApiAccountRelationshipFollowUpdate.fromJson(
              json['followUpdate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiWebSocketsEventToJson(
    _$_UnifediApiWebSocketsEvent instance) {
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
  writeNotNull('followUpdate', instance.followUpdate?.toJson());
  return val;
}
