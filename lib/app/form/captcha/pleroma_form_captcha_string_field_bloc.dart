import 'dart:async';

import 'package:fedi/pleroma/captcha/pleroma_captcha_model.dart';
import 'package:fedi/ui/form/field/value/string/form_captcha_string_field_bloc.dart';

abstract class IPleromaFormCaptchaStringFieldBloc
    implements IFormCaptchaStringFieldBloc {
  PleromaCaptcha get captcha;

  Stream<PleromaCaptcha> get captchaStream;

  DateTime get captchaLoadedDateTime;

  Stream<DateTime> get captchaLoadedDateTimeStream;
}
