// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_oauth_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiOAuthTokenAdapter extends TypeAdapter<PleromaApiOAuthToken> {
  @override
  final int typeId = 0;

  @override
  PleromaApiOAuthToken read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiOAuthToken(
      accessToken: fields[0] as String,
      tokenType: fields[1] as String,
      id: fields[2] as String?,
      me: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiOAuthToken obj) {
    writer
      ..writeByte(4)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.me)
      ..writeByte(0)
      ..write(obj.accessToken)
      ..writeByte(1)
      ..write(obj.tokenType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiOAuthTokenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiOAuthToken _$$_PleromaApiOAuthTokenFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiOAuthToken(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
      id: JsonParseHelper.toStringFromAnyNullable(json['id']),
      me: json['me'] as String?,
    );

Map<String, dynamic> _$$_PleromaApiOAuthTokenToJson(
    _$_PleromaApiOAuthToken instance) {
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
