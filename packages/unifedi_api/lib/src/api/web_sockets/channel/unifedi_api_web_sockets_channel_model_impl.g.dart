// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_web_sockets_channel_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiWebSocketsChannelAdapter
    extends TypeAdapter<UnifediApiWebSocketsChannel> {
  @override
  final int typeId = 0;

  @override
  UnifediApiWebSocketsChannel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiWebSocketsChannel(
      type: fields[0] as String,
      localOnly: fields[1] as bool?,
      remoteOnly: fields[2] as bool?,
      mediaOnly: fields[3] as bool?,
      onlyFromInstance: fields[4] as String?,
      fromAccountIdOnly: fields[5] as String?,
      chatOnly: fields[6] as bool?,
      notificationOnly: fields[7] as bool?,
      listIdOnly: fields[8] as String?,
      tag: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiWebSocketsChannel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.localOnly)
      ..writeByte(2)
      ..write(obj.remoteOnly)
      ..writeByte(3)
      ..write(obj.mediaOnly)
      ..writeByte(4)
      ..write(obj.onlyFromInstance)
      ..writeByte(5)
      ..write(obj.fromAccountIdOnly)
      ..writeByte(6)
      ..write(obj.chatOnly)
      ..writeByte(7)
      ..write(obj.notificationOnly)
      ..writeByte(8)
      ..write(obj.listIdOnly)
      ..writeByte(9)
      ..write(obj.tag);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiWebSocketsChannelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiWebSocketsChannel _$$_UnifediApiWebSocketsChannelFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiWebSocketsChannel(
      type: json['type'] as String,
      localOnly: json['local_only'] as bool?,
      remoteOnly: json['remote_only'] as bool?,
      mediaOnly: json['media_only'] as bool?,
      onlyFromInstance: json['only_from_instance'] as String?,
      fromAccountIdOnly: json['from_account_id_only'] as String?,
      chatOnly: json['chat_only'] as bool?,
      notificationOnly: json['notification_only'] as bool?,
      listIdOnly: json['list_id_only'] as String?,
      tag: json['tag'] as String?,
    );

Map<String, dynamic> _$$_UnifediApiWebSocketsChannelToJson(
    _$_UnifediApiWebSocketsChannel instance) {
  final val = <String, dynamic>{
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('local_only', instance.localOnly);
  writeNotNull('remote_only', instance.remoteOnly);
  writeNotNull('media_only', instance.mediaOnly);
  writeNotNull('only_from_instance', instance.onlyFromInstance);
  writeNotNull('from_account_id_only', instance.fromAccountIdOnly);
  writeNotNull('chat_only', instance.chatOnly);
  writeNotNull('notification_only', instance.notificationOnly);
  writeNotNull('list_id_only', instance.listIdOnly);
  writeNotNull('tag', instance.tag);
  return val;
}
