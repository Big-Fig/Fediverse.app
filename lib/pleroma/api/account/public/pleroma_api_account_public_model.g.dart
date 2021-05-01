// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_account_public_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaApiAccountPublicRegisterRequest _$PleromaApiAccountRegisterRequestFromJson(
    Map<String, dynamic> json) {
  return PleromaApiAccountPublicRegisterRequest(
    agreement: json['agreement'] as bool?,
    email: json['email'] as String?,
    locale: json['locale'] as String?,
    password: json['password'] as String?,
    reason: json['reason'] as String?,
    username: json['username'] as String?,
    captchaToken: json['captcha_token'] as String?,
    captchaAnswerData: json['captcha_answer_data'] as String?,
    captchaSolution: json['captcha_solution'] as String?,
  );
}

Map<String, dynamic> _$PleromaApiAccountRegisterRequestToJson(
    PleromaApiAccountPublicRegisterRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('agreement', instance.agreement);
  writeNotNull('email', instance.email);
  writeNotNull('locale', instance.locale);
  writeNotNull('password', instance.password);
  writeNotNull('reason', instance.reason);
  writeNotNull('username', instance.username);
  writeNotNull('captcha_token', instance.captchaToken);
  writeNotNull('captcha_answer_data', instance.captchaAnswerData);
  writeNotNull('captcha_solution', instance.captchaSolution);
  return val;
}
