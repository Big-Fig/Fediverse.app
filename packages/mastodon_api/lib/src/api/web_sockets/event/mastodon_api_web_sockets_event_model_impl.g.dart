// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_web_sockets_event_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiWebSocketsEventAdapter
    extends TypeAdapter<MastodonApiWebSocketsEvent> {
  @override
  final int typeId = 0;

  @override
  MastodonApiWebSocketsEvent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiWebSocketsEvent(
      type: fields[0] as String,
      payload: fields[10] as String?,
      channel: fields[2] as MastodonApiWebSocketsChannel,
      status: fields[3] as MastodonApiStatus?,
      notification: fields[4] as MastodonApiNotification?,
      announcement: fields[5] as MastodonApiAnnouncement?,
      conversation: fields[7] as MastodonApiConversation?,
      id: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiWebSocketsEvent obj) {
    writer
      ..writeByte(8)
      ..writeByte(2)
      ..write(obj.channel)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.notification)
      ..writeByte(5)
      ..write(obj.announcement)
      ..writeByte(7)
      ..write(obj.conversation)
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
      other is MastodonApiWebSocketsEventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MastodonApiWebSocketsRawEventAdapter
    extends TypeAdapter<MastodonApiWebSocketsRawEvent> {
  @override
  final int typeId = 0;

  @override
  MastodonApiWebSocketsRawEvent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiWebSocketsRawEvent(
      type: fields[0] as String,
      payload: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiWebSocketsRawEvent obj) {
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
      other is MastodonApiWebSocketsRawEventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiWebSocketsEvent _$$_MastodonApiWebSocketsEventFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiWebSocketsEvent(
      type: json['event'] as String,
      payload: json['payload'] as String?,
      channel: MastodonApiWebSocketsChannel.fromJson(
          json['channel'] as Map<String, dynamic>),
      status: json['status'] == null
          ? null
          : MastodonApiStatus.fromJson(json['status'] as Map<String, dynamic>),
      notification: json['notification'] == null
          ? null
          : MastodonApiNotification.fromJson(
              json['notification'] as Map<String, dynamic>),
      announcement: json['announcement'] == null
          ? null
          : MastodonApiAnnouncement.fromJson(
              json['announcement'] as Map<String, dynamic>),
      conversation: json['conversation'] == null
          ? null
          : MastodonApiConversation.fromJson(
              json['conversation'] as Map<String, dynamic>),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_MastodonApiWebSocketsEventToJson(
    _$_MastodonApiWebSocketsEvent instance) {
  final val = <String, dynamic>{
    'event': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('payload', instance.payload);
  val['channel'] = instance.channel.toJson();
  writeNotNull('status', instance.status?.toJson());
  writeNotNull('notification', instance.notification?.toJson());
  writeNotNull('announcement', instance.announcement?.toJson());
  writeNotNull('conversation', instance.conversation?.toJson());
  writeNotNull('id', instance.id);
  return val;
}

_$_MastodonApiWebSocketsRawEvent _$$_MastodonApiWebSocketsRawEventFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiWebSocketsRawEvent(
      type: json['event'] as String,
      payload: json['payload'] as String?,
    );

Map<String, dynamic> _$$_MastodonApiWebSocketsRawEventToJson(
    _$_MastodonApiWebSocketsRawEvent instance) {
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
