import '../pleroma_api_model.dart';
import 'type/pleroma_api_captcha_type_sealed.dart';

abstract class IPleromaApiCaptcha implements IPleromaApiResponse {
  int? get secondsValid;

  String? get token;
  String? get answerData;

  String get type;

  String? get url;
}

extension IPleromaApiCaptchaTypeExtension on IPleromaApiCaptcha {
  PleromaApiCaptchaType get typeAsPleromaApi => type.toPleromaApiCaptchaType();
}
