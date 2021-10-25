// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_register_account_response_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiRegisterAccountResponseAdapter
    extends TypeAdapter<UnifediApiRegisterAccountResponse> {
  @override
  final int typeId = 0;

  @override
  UnifediApiRegisterAccountResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiRegisterAccountResponse(
      approvalRequired: fields[0] as bool?,
      emailConformationRequired: fields[1] as bool?,
      authToken: fields[2] as UnifediApiOAuthToken?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiRegisterAccountResponse obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.approvalRequired)
      ..writeByte(1)
      ..write(obj.emailConformationRequired)
      ..writeByte(2)
      ..write(obj.authToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiRegisterAccountResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiRegisterAccountResponse
    _$$_UnifediApiRegisterAccountResponseFromJson(Map<String, dynamic> json) =>
        _$_UnifediApiRegisterAccountResponse(
          approvalRequired: json['approval_required'] as bool?,
          emailConformationRequired:
              json['email_conformation_required'] as bool?,
          authToken: json['auth_token'] == null
              ? null
              : UnifediApiOAuthToken.fromJson(
                  json['auth_token'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiRegisterAccountResponseToJson(
    _$_UnifediApiRegisterAccountResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('approval_required', instance.approvalRequired);
  writeNotNull(
      'email_conformation_required', instance.emailConformationRequired);
  writeNotNull('auth_token', instance.authToken?.toJson());
  return val;
}
