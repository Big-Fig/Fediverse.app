// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_client_application_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiClientApplicationAdapter
    extends TypeAdapter<UnifediApiClientApplication> {
  @override
  final int typeId = 0;

  @override
  UnifediApiClientApplication read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiClientApplication(
      name: fields[0] as String?,
      website: fields[1] as String?,
      vapidKey: fields[2] as String?,
      clientId: fields[3] as String?,
      clientSecret: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiClientApplication obj) {
    writer
      ..writeByte(5)
      ..writeByte(3)
      ..write(obj.clientId)
      ..writeByte(4)
      ..write(obj.clientSecret)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.website)
      ..writeByte(2)
      ..write(obj.vapidKey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiClientApplicationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiClientApplication _$$_UnifediApiClientApplicationFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiClientApplication(
      name: json['name'] as String?,
      website: json['website'] as String?,
      vapidKey: json['vapid_key'] as String?,
      clientId: json['client_id'] as String?,
      clientSecret: json['client_secret'] as String?,
    );

Map<String, dynamic> _$$_UnifediApiClientApplicationToJson(
    _$_UnifediApiClientApplication instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('website', instance.website);
  writeNotNull('vapid_key', instance.vapidKey);
  writeNotNull('client_id', instance.clientId);
  writeNotNull('client_secret', instance.clientSecret);
  return val;
}
