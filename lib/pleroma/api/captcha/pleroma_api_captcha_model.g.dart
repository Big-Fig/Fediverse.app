// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_captcha_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaApiCaptcha _$PleromaApiCaptchaFromJson(Map<String, dynamic> json) {
  return PleromaApiCaptcha(
    answerData: json['answer_data'] as String?,
    secondsValid: json['seconds_valid'] as int?,
    token: json['token'] as String?,
    type: json['type'] as String?,
    url: json['url'] as String?,
  );
}

Map<String, dynamic> _$PleromaApiCaptchaToJson(PleromaApiCaptcha instance) =>
    <String, dynamic>{
      'answer_data': instance.answerData,
      'seconds_valid': instance.secondsValid,
      'token': instance.token,
      'type': instance.type,
      'url': instance.url,
    };
