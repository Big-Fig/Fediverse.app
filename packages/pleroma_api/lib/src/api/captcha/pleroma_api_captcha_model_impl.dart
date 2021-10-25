import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_captcha_model.dart';

part 'pleroma_api_captcha_model_impl.freezed.dart';

part 'pleroma_api_captcha_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiCaptcha with _$PleromaApiCaptcha implements IPleromaApiCaptcha {
  const factory PleromaApiCaptcha({
    @HiveField(1) @JsonKey(name: 'seconds_valid') required int? secondsValid,
    @HiveField(2) required String? token,
    @HiveField(3) required String type,
    @HiveField(4) required String? url,
    @JsonKey(name: 'answer_data') @HiveField(5) required String? answerData,
  }) = _PleromaApiCaptcha;

  factory PleromaApiCaptcha.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiCaptchaFromJson(json);
}

extension IPleromaApiCaptchaInterfaceExtension on IPleromaApiCaptcha {
  PleromaApiCaptcha toPleromaApiCaptcha({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiCaptcha(
          secondsValid: secondsValid,
          token: token,
          type: type,
          url: url,
          answerData: answerData,
        ),
        forceNewObject: forceNewObject,
      );
}
