// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_push_subscription_alerts_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiPushSubscriptionAlertsAdapter
    extends TypeAdapter<UnifediApiPushSubscriptionAlerts> {
  @override
  final int typeId = 0;

  @override
  UnifediApiPushSubscriptionAlerts read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiPushSubscriptionAlerts(
      favourite: fields[0] as bool?,
      follow: fields[1] as bool?,
      mention: fields[2] as bool?,
      reblog: fields[3] as bool?,
      poll: fields[4] as bool?,
      chatMention: fields[5] as bool?,
      emojiReaction: fields[6] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiPushSubscriptionAlerts obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.favourite)
      ..writeByte(1)
      ..write(obj.follow)
      ..writeByte(2)
      ..write(obj.mention)
      ..writeByte(3)
      ..write(obj.reblog)
      ..writeByte(4)
      ..write(obj.poll)
      ..writeByte(5)
      ..write(obj.chatMention)
      ..writeByte(6)
      ..write(obj.emojiReaction);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiPushSubscriptionAlertsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiPushSubscribeRequestDataAlerts
    _$$_UnifediApiPushSubscribeRequestDataAlertsFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiPushSubscribeRequestDataAlerts(
          favourite: json['favourite'] as bool?,
          follow: json['follow'] as bool?,
          mention: json['mention'] as bool?,
          reblog: json['reblog'] as bool?,
          poll: json['poll'] as bool?,
          chatMention: json['unifedi:chat_mention'] as bool?,
          emojiReaction: json['unifedi:emoji_reaction'] as bool?,
        );

Map<String, dynamic> _$$_UnifediApiPushSubscribeRequestDataAlertsToJson(
    _$_UnifediApiPushSubscribeRequestDataAlerts instance) {
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
  writeNotNull('unifedi:chat_mention', instance.chatMention);
  writeNotNull('unifedi:emoji_reaction', instance.emojiReaction);
  return val;
}
