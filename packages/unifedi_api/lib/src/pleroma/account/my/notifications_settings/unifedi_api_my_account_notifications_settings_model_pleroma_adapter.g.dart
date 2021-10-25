// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_my_account_notifications_settings_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiMyAccountNotificationsSettingsPleromaAdapterAdapter
    extends TypeAdapter<
        UnifediApiMyAccountNotificationsSettingsPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiMyAccountNotificationsSettingsPleromaAdapter read(
      BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiMyAccountNotificationsSettingsPleromaAdapter(
      fields[0] as PleromaApiMyAccountNotificationsSettings,
    );
  }

  @override
  void write(BinaryWriter writer,
      UnifediApiMyAccountNotificationsSettingsPleromaAdapter obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiMyAccountNotificationsSettingsPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiMyAccountNotificationsSettingsPleromaAdapter
    _$$_UnifediApiMyAccountNotificationsSettingsPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiMyAccountNotificationsSettingsPleromaAdapter(
          PleromaApiMyAccountNotificationsSettings.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String,
    dynamic> _$$_UnifediApiMyAccountNotificationsSettingsPleromaAdapterToJson(
        _$_UnifediApiMyAccountNotificationsSettingsPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
