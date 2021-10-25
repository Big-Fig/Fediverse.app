import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_captcha_model.dart';

part 'unifedi_api_captcha_model_impl.freezed.dart';

part 'unifedi_api_captcha_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class UnifediApiCaptcha with _$UnifediApiCaptcha implements IUnifediApiCaptcha {
  const factory UnifediApiCaptcha({
    @HiveField(1) @JsonKey(name: 'seconds_valid') required int? secondsValid,
    @HiveField(2) required String? token,
    @HiveField(3) required String type,
    @HiveField(4) required String? url,
    @HiveField(5) required String? answerData,
  }) = _UnifediApiCaptcha;

  factory UnifediApiCaptcha.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiCaptchaFromJson(json);
}

extension IUnifediApiCaptchaInterfaceExtension on IUnifediApiCaptcha {
  UnifediApiCaptcha toUnifediApiCaptcha({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiCaptcha(
          secondsValid: secondsValid,
          token: token,
          type: type,
          url: url,
          answerData: answerData,
        ),
        forceNewObject: forceNewObject,
      );
}
