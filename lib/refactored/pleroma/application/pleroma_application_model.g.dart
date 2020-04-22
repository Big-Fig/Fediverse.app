// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_application_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaClientApplicationAdapter
    extends TypeAdapter<PleromaClientApplication> {
  @override
  PleromaClientApplication read(BinaryReader reader) {
    var obj = PleromaClientApplication();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.name = reader.read() as String;
          break;
        case 1:
          obj.website = reader.read() as String;
          break;
        case 2:
          obj.vapidKey = reader.read() as String;
          break;
        case 3:
          obj.clientId = reader.read() as String;
          break;
        case 4:
          obj.clientSecret = reader.read() as String;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, PleromaClientApplication obj) {
    writer.writeByte(5);
    writer.writeByte(0);
    writer.write(obj.name);
    writer.writeByte(1);
    writer.write(obj.website);
    writer.writeByte(2);
    writer.write(obj.vapidKey);
    writer.writeByte(3);
    writer.write(obj.clientId);
    writer.writeByte(4);
    writer.write(obj.clientSecret);
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
