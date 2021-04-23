import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/pleroma/api/captcha/pleroma_api_captcha_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICaptchaStringValueFormFieldBloc
    extends IStringValueFormFieldBloc {
  static ICaptchaStringValueFormFieldBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ICaptchaStringValueFormFieldBloc>(context, listen: listen);

  bool get isExist;

  Stream<bool> get isExistStream;

  PleromaApiCaptcha? get captcha;

  Stream<PleromaApiCaptcha?> get captchaStream;

  PleromaApiCaptchaType? get captchaType;

  Stream<PleromaApiCaptchaType?> get captchaTypeStream;

  Stream<Image?> get captchaImageStream;

  Future reloadCaptcha();
}
