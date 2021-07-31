import 'package:pleroma_fediverse_api/src/pleroma/api/captcha/pleroma_api_captcha_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';

abstract class IPleromaApiCaptchaService implements IPleromaApi {
  Future<IPleromaApiCaptcha> getCaptcha();
}
