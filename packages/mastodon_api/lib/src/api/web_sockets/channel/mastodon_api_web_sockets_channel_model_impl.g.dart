// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_web_sockets_channel_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiWebSocketsChannelAdapter
    extends TypeAdapter<MastodonApiWebSocketsChannel> {
  @override
  final int typeId = 0;

  @override
  MastodonApiWebSocketsChannel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiWebSocketsChannel(
      type: fields[0] as String,
      localOnly: fields[1] as bool?,
      mediaOnly: fields[2] as bool?,
      fromAccountIdOnly: fields[3] as String?,
      notificationOnly: fields[4] as bool?,
      listIdOnly: fields[5] as String?,
      tag: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiWebSocketsChannel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.localOnly)
      ..writeByte(2)
      ..write(obj.mediaOnly)
      ..writeByte(3)
      ..write(obj.fromAccountIdOnly)
      ..writeByte(4)
      ..write(obj.notificationOnly)
      ..writeByte(5)
      ..write(obj.listIdOnly)
      ..writeByte(6)
      ..write(obj.tag);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiWebSocketsChannelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiWebSocketsChannel _$$_MastodonApiWebSocketsChannelFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiWebSocketsChannel(
      type: json['type'] as String,
      localOnly: json['local_only'] as bool?,
      mediaOnly: json['media_only'] as bool?,
      fromAccountIdOnly: json['from_account_id_only'] as String?,
      notificationOnly: json['notification_only'] as bool?,
      listIdOnly: json['list_id_only'] as String?,
      tag: json['tag'] as String?,
    );

Map<String, dynamic> _$$_MastodonApiWebSocketsChannelToJson(
    _$_MastodonApiWebSocketsChannel instance) {
  final val = <String, dynamic>{
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('local_only', instance.localOnly);
  writeNotNull('media_only', instance.mediaOnly);
  writeNotNull('from_account_id_only', instance.fromAccountIdOnly);
  writeNotNull('notification_only', instance.notificationOnly);
  writeNotNull('list_id_only', instance.listIdOnly);
  writeNotNull('tag', instance.tag);
  return val;
}
