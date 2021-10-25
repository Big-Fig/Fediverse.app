// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_push_subscription_alerts_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiPushSubscriptionAlertsAdapter
    extends TypeAdapter<PleromaApiPushSubscriptionAlerts> {
  @override
  final int typeId = 0;

  @override
  PleromaApiPushSubscriptionAlerts read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiPushSubscriptionAlerts(
      favourite: fields[0] as bool?,
      follow: fields[1] as bool?,
      mention: fields[2] as bool?,
      reblog: fields[3] as bool?,
      poll: fields[4] as bool?,
      pleromaChatMention: fields[5] as bool?,
      pleromaEmojiReaction: fields[6] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiPushSubscriptionAlerts obj) {
    writer
      ..writeByte(7)
      ..writeByte(5)
      ..write(obj.pleromaChatMention)
      ..writeByte(6)
      ..write(obj.pleromaEmojiReaction)
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
      other is PleromaApiPushSubscriptionAlertsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiPushSubscribeRequestDataAlerts
    _$$_PleromaApiPushSubscribeRequestDataAlertsFromJson(
            Map<String, dynamic> json) =>
        _$_PleromaApiPushSubscribeRequestDataAlerts(
          favourite: json['favourite'] as bool?,
          follow: json['follow'] as bool?,
          mention: json['mention'] as bool?,
          reblog: json['reblog'] as bool?,
          poll: json['poll'] as bool?,
          pleromaChatMention: json['pleroma:chat_mention'] as bool?,
          pleromaEmojiReaction: json['pleroma:emoji_reaction'] as bool?,
        );

Map<String, dynamic> _$$_PleromaApiPushSubscribeRequestDataAlertsToJson(
    _$_PleromaApiPushSubscribeRequestDataAlerts instance) {
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
  writeNotNull('pleroma:chat_mention', instance.pleromaChatMention);
  writeNotNull('pleroma:emoji_reaction', instance.pleromaEmojiReaction);
  return val;
}
