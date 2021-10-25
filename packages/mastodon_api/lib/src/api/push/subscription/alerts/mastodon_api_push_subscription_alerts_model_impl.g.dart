// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_push_subscription_alerts_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiPushSubscriptionAlertsAdapter
    extends TypeAdapter<MastodonApiPushSubscriptionAlerts> {
  @override
  final int typeId = 0;

  @override
  MastodonApiPushSubscriptionAlerts read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiPushSubscriptionAlerts(
      favourite: fields[0] as bool?,
      follow: fields[1] as bool?,
      mention: fields[2] as bool?,
      reblog: fields[3] as bool?,
      poll: fields[4] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiPushSubscriptionAlerts obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.favourite)
      ..writeByte(1)
      ..write(obj.follow)
      ..writeByte(2)
      ..write(obj.mention)
      ..writeByte(3)
      ..write(obj.reblog)
      ..writeByte(4)
      ..write(obj.poll);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiPushSubscriptionAlertsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiPushSubscribeRequestDataAlerts
    _$$_MastodonApiPushSubscribeRequestDataAlertsFromJson(
            Map<String, dynamic> json) =>
        _$_MastodonApiPushSubscribeRequestDataAlerts(
          favourite: json['favourite'] as bool?,
          follow: json['follow'] as bool?,
          mention: json['mention'] as bool?,
          reblog: json['reblog'] as bool?,
          poll: json['poll'] as bool?,
        );

Map<String, dynamic> _$$_MastodonApiPushSubscribeRequestDataAlertsToJson(
    _$_MastodonApiPushSubscribeRequestDataAlerts instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('favourite', instance.favourite);
  writeNotNull('follow', instance.follow);
  writeNotNull('mention', instance.mention);
  writeNotNull('reblog', instance.reblog);
  writeNotNull('poll', instance.poll);
  return val;
}
