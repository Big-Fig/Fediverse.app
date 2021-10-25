// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_register_account_response_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiRegisterAccountResponseAdapter
    extends TypeAdapter<PleromaApiRegisterAccountResponse> {
  @override
  final int typeId = 0;

  @override
  PleromaApiRegisterAccountResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiRegisterAccountResponse(
      approvalRequired: fields[0] as bool?,
      emailConformationRequired: fields[1] as bool?,
      authToken: fields[2] as PleromaApiOAuthToken?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiRegisterAccountResponse obj) {
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
      other is PleromaApiRegisterAccountResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiRegisterAccountResponse
    _$$_PleromaApiRegisterAccountResponseFromJson(Map<String, dynamic> json) =>
        _$_PleromaApiRegisterAccountResponse(
          approvalRequired: json['approval_required'] as bool?,
          emailConformationRequired:
              json['email_conformation_required'] as bool?,
          authToken: json['auth_token'] == null
              ? null
              : PleromaApiOAuthToken.fromJson(
                  json['auth_token'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_PleromaApiRegisterAccountResponseToJson(
    _$_PleromaApiRegisterAccountResponse instance) {
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
