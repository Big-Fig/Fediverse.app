// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_oauth_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiOAuthTokenAdapter extends TypeAdapter<UnifediApiOAuthToken> {
  @override
  final int typeId = 0;

  @override
  UnifediApiOAuthToken read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiOAuthToken(
      accessToken: fields[0] as String,
      tokenType: fields[1] as String,
      id: fields[2] as String?,
      me: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiOAuthToken obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.accessToken)
      ..writeByte(1)
      ..write(obj.tokenType)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.me);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiOAuthTokenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiOAuthToken _$$_UnifediApiOAuthTokenFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiOAuthToken(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
      id: json['id'] as String?,
      me: json['me'] as String?,
    );

Map<String, dynamic> _$$_UnifediApiOAuthTokenToJson(
    _$_UnifediApiOAuthToken instance) {
  final val = <String, dynamic>{
    'access_token': instance.accessToken,
    'token_type': instance.tokenType,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('me', instance.me);
  return val;
}
