// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_application_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiClientApplicationAdapter
    extends TypeAdapter<PleromaApiClientApplication> {
  @override
  final int typeId = 20;

  @override
  PleromaApiClientApplication read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiClientApplication(
      name: fields[0] as String?,
      website: fields[1] as String?,
      vapidKey: fields[2] as String?,
      clientId: fields[3] as String?,
      clientSecret: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiClientApplication obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.website)
      ..writeByte(2)
      ..write(obj.vapidKey)
      ..writeByte(3)
      ..write(obj.clientId)
      ..writeByte(4)
      ..write(obj.clientSecret);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiClientApplicationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaApiApplication _$PleromaApiApplicationFromJson(
    Map<String, dynamic> json) {
  return PleromaApiApplication(
    name: json['name'] as String?,
    website: json['website'] as String?,
    vapidKey: json['vapid_key'] as String?,
  );
}

Map<String, dynamic> _$PleromaApiApplicationToJson(
        PleromaApiApplication instance) =>
    <String, dynamic>{
      'name': instance.name,
      'website': instance.website,
      'vapid_key': instance.vapidKey,
    };

PleromaApiClientApplication _$PleromaApiClientApplicationFromJson(
    Map<String, dynamic> json) {
  return PleromaApiClientApplication(
    name: json['name'] as String?,
    website: json['website'] as String?,
    vapidKey: json['vapid_key'] as String?,
    clientId: json['client_id'] as String?,
    clientSecret: json['client_secret'] as String?,
  );
}

Map<String, dynamic> _$PleromaApiClientApplicationToJson(
        PleromaApiClientApplication instance) =>
    <String, dynamic>{
      'name': instance.name,
      'website': instance.website,
      'vapid_key': instance.vapidKey,
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
    };
