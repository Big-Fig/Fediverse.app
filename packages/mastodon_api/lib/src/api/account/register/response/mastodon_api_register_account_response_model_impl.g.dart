// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_register_account_response_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiRegisterAccountResponseAdapter
    extends TypeAdapter<MastodonApiRegisterAccountResponse> {
  @override
  final int typeId = 0;

  @override
  MastodonApiRegisterAccountResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiRegisterAccountResponse(
      approvalRequired: fields[0] as bool?,
      authToken: fields[1] as MastodonApiOAuthToken?,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiRegisterAccountResponse obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.approvalRequired)
      ..writeByte(1)
      ..write(obj.authToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiRegisterAccountResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiRegisterAccountResponse
    _$$_MastodonApiRegisterAccountResponseFromJson(Map<String, dynamic> json) =>
        _$_MastodonApiRegisterAccountResponse(
          approvalRequired: json['approval_required'] as bool?,
          authToken: json['auth_token'] == null
              ? null
              : MastodonApiOAuthToken.fromJson(
                  json['auth_token'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_MastodonApiRegisterAccountResponseToJson(
    _$_MastodonApiRegisterAccountResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('approval_required', instance.approvalRequired);
  writeNotNull('auth_token', instance.authToken?.toJson());
  return val;
}
