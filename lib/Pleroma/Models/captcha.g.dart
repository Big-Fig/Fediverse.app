// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'captcha.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Captcha _$CaptchaFromJson(Map<String, dynamic> json) {
  return Captcha(
    answerData: json['answerData'] as String,
    token: json['token'] as String,
    type: json['type'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$CaptchaToJson(Captcha instance) => <String, dynamic>{
      'answerData': instance.answerData,
      'token': instance.token,
      'type': instance.type,
      'url': instance.url,
    };
