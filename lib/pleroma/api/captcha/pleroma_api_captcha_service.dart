import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/captcha/pleroma_api_captcha_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiCaptchaService implements IPleromaApi {
  static IPleromaApiCaptchaService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPleromaApiCaptchaService>(context, listen: listen);

  Future<IPleromaApiCaptcha> getCaptcha();

}
