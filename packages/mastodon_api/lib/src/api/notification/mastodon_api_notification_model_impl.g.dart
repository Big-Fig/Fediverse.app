// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_notification_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiNotificationAdapter
    extends TypeAdapter<MastodonApiNotification> {
  @override
  final int typeId = 0;

  @override
  MastodonApiNotification read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiNotification(
      account: fields[0] as MastodonApiAccount?,
      createdAt: fields[2] as DateTime,
      id: fields[3] as String,
      type: fields[4] as String,
      status: fields[5] as MastodonApiStatus?,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiNotification obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.account)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiNotificationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiNotification _$$_MastodonApiNotificationFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiNotification(
      account: json['account'] == null
          ? null
          : MastodonApiAccount.fromJson(
              json['account'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      id: json['id'] as String,
      type: json['type'] as String,
      status: json['status'] == null
          ? null
          : MastodonApiStatus.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MastodonApiNotificationToJson(
    _$_MastodonApiNotification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('account', instance.account?.toJson());
  val['created_at'] = instance.createdAt.toIso8601String();
  val['id'] = instance.id;
  val['type'] = instance.type;
  writeNotNull('status', instance.status?.toJson());
  return val;
}
