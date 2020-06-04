// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_subscription_local_preferences_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PushSubscriptionLocalPreferencesAdapter
    extends TypeAdapter<PushSubscriptionLocalPreferences> {
  @override
  PushSubscriptionLocalPreferences read(BinaryReader reader) {
    var obj = PushSubscriptionLocalPreferences();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 1:
          obj.favourite = reader.read() as bool;
          break;
        case 2:
          obj.follow = reader.read() as bool;
          break;
        case 3:
          obj.mention = reader.read() as bool;
          break;
        case 4:
          obj.reblog = reader.read() as bool;
          break;
        case 5:
          obj.poll = reader.read() as bool;
          break;
        case 6:
          obj.chat = reader.read() as bool;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, PushSubscriptionLocalPreferences obj) {
    writer.writeByte(6);
    writer.writeByte(1);
    writer.write(obj.favourite);
    writer.writeByte(2);
    writer.write(obj.follow);
    writer.writeByte(3);
    writer.write(obj.mention);
    writer.writeByte(4);
    writer.write(obj.reblog);
    writer.writeByte(5);
    writer.write(obj.poll);
    writer.writeByte(6);
    writer.write(obj.chat);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushSubscriptionLocalPreferences _$PushSubscriptionLocalPreferencesFromJson(
    Map<String, dynamic> json) {
  return PushSubscriptionLocalPreferences(
    favourite: json['favourite'] as bool,
    follow: json['follow'] as bool,
    mention: json['mention'] as bool,
    reblog: json['reblog'] as bool,
    poll: json['poll'] as bool,
    chat: json['chat'] as bool,
  );
}

Map<String, dynamic> _$PushSubscriptionLocalPreferencesToJson(
        PushSubscriptionLocalPreferences instance) =>
    <String, dynamic>{
      'favourite': instance.favourite,
      'follow': instance.follow,
      'mention': instance.mention,
      'reblog': instance.reblog,
      'poll': instance.poll,
      'chat': instance.chat,
    };
