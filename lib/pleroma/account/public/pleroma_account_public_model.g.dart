// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_account_public_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaAccountRegisterRequest _$PleromaAccountRegisterRequestFromJson(
    Map<String, dynamic> json) {
  return PleromaAccountRegisterRequest(
    agreement: json['agreement'] as bool,
    email: json['email'] as String,
    locale: json['locale'] as String,
    password: json['password'] as String,
    reason: json['reason'] as String,
    username: json['username'] as String,
  );
}

Map<String, dynamic> _$PleromaAccountRegisterRequestToJson(
        PleromaAccountRegisterRequest instance) =>
    <String, dynamic>{
      'agreement': instance.agreement,
      'email': instance.email,
      'locale': instance.locale,
      'password': instance.password,
      'reason': instance.reason,
      'username': instance.username,
    };
