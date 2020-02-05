// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ClientSettings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClientSettingsAdapter extends TypeAdapter<ClientSettings> {
  @override
  ClientSettings read(BinaryReader reader) {
    var obj = ClientSettings();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.clientId = reader.read() as String;
          break;
        case 1:
          obj.clientSecret = reader.read() as String;
          break;
        case 2:
          obj.id = reader.read() as String;
          break;
        case 3:
          obj.name = reader.read() as String;
          break;
        case 4:
          obj.redirectUri = reader.read() as String;
          break;
        case 5:
          obj.website = reader.read() as String;
          break;
        case 6:
          obj.vapidKey = reader.read() as String;
          break;
        case 7:
          obj.account = reader.read() as String;
          break;
        case 8:
          obj.code = reader.read() as String;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, ClientSettings obj) {
    writer.writeByte(9);
    writer.writeByte(0);
    writer.write(obj.clientId);
    writer.writeByte(1);
    writer.write(obj.clientSecret);
    writer.writeByte(2);
    writer.write(obj.id);
    writer.writeByte(3);
    writer.write(obj.name);
    writer.writeByte(4);
    writer.write(obj.redirectUri);
    writer.writeByte(5);
    writer.write(obj.website);
    writer.writeByte(6);
    writer.write(obj.vapidKey);
    writer.writeByte(7);
    writer.write(obj.account);
    writer.writeByte(8);
    writer.write(obj.code);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientSettings _$ClientSettingsFromJson(Map<String, dynamic> json) {
  return ClientSettings(
    clientId: json['client_id'] as String,
    clientSecret: json['client_secret'] as String,
    id: json['id'] as String,
    name: json['name'] as String,
    redirectUri: json['redirect_uri'] as String,
    website: json['website'] as String,
    vapidKey: json['vapid_key'] as String,
    code: json['code'] as String,
  )..account = json['account'] as String;
}

Map<String, dynamic> _$ClientSettingsToJson(ClientSettings instance) =>
    <String, dynamic>{
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
      'id': instance.id,
      'name': instance.name,
      'redirect_uri': instance.redirectUri,
      'website': instance.website,
      'vapid_key': instance.vapidKey,
      'account': instance.account,
      'code': instance.code,
    };
