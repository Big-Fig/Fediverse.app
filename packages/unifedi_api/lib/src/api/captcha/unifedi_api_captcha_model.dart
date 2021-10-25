import '../unifedi_api_model.dart';
import 'type/unifedi_api_captcha_type_sealed.dart';

abstract class IUnifediApiCaptcha implements IUnifediApiResponsePart {
  int? get secondsValid;

  String? get token;

  String get type;

  String? get url;
  String? get answerData;
}

extension IUnifediApiCaptchaExtension on IUnifediApiCaptcha {
  UnifediApiCaptchaType get typeAsUnifediApi =>
      UnifediApiCaptchaType.fromStringValue(
        type,
      );
}
