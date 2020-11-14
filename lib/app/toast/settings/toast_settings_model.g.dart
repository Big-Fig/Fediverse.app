// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toast_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToastSettingsAdapter extends TypeAdapter<ToastSettings> {
  @override
  final int typeId = 52;

  @override
  ToastSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToastSettings(
      notificationForMention: fields[0] as bool,
      notificationForChatAndDm: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ToastSettings obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.notificationForMention)
      ..writeByte(1)
      ..write(obj.notificationForChatAndDm);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToastSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToastSettings _$ToastSettingsFromJson(Map<String, dynamic> json) {
  return ToastSettings(
    notificationForMention: json['notification_for_mention'] as bool,
    notificationForChatAndDm: json['notification_for_chat_and_dm'] as bool,
  );
}

Map<String, dynamic> _$ToastSettingsToJson(ToastSettings instance) =>
    <String, dynamic>{
      'notification_for_mention': instance.notificationForMention,
      'notification_for_chat_and_dm': instance.notificationForChatAndDm,
    };
