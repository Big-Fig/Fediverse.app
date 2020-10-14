// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_application_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaClientApplicationAdapter
    extends TypeAdapter<PleromaClientApplication> {
  @override
  PleromaClientApplication read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaClientApplication(
      name: fields[0] as String,
      website: fields[1] as String,
      vapidKey: fields[2] as String,
      clientId: fields[3] as String,
      clientSecret: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaClientApplication obj) {
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
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaApplication _$PleromaApplicationFromJson(Map<String, dynamic> json) {
  return PleromaApplication(
    name: json['name'] as String,
    website: json['website'] as String,
    vapidKey: json['vapid_key'] as String,
  );
}

Map<String, dynamic> _$PleromaApplicationToJson(PleromaApplication instance) =>
    <String, dynamic>{
      'name': instance.name,
      'website': instance.website,
      'vapid_key': instance.vapidKey,
    };

PleromaClientApplication _$PleromaClientApplicationFromJson(
    Map<String, dynamic> json) {
  return PleromaClientApplication(
    name: json['name'] as String,
    website: json['website'] as String,
    vapidKey: json['vapid_key'] as String,
    clientId: json['client_id'] as String,
    clientSecret: json['client_secret'] as String,
  );
}

Map<String, dynamic> _$PleromaClientApplicationToJson(
        PleromaClientApplication instance) =>
    <String, dynamic>{
      'name': instance.name,
      'website': instance.website,
      'vapid_key': instance.vapidKey,
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
    };
