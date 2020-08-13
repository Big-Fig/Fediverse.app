import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/captcha/pleroma_captcha_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaCaptchaService implements IPleromaApi {
  static IPleromaCaptchaService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPleromaCaptchaService>(context, listen: listen);

  Future<IPleromaCaptcha> getCaptcha();

}
