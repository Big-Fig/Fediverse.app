import 'dart:async';

import 'package:fedi/pleroma/captcha/pleroma_captcha_model.dart';
import 'package:fedi/form/field/value/string/captcha/captcha_string_value_form_field_bloc.dart';

abstract class IPleromaFormCaptchaStringFieldBloc
    implements ICaptchaStringFormFieldBloc {
  PleromaCaptcha get captcha;

  Stream<PleromaCaptcha> get captchaStream;

  DateTime get captchaLoadedDateTime;

  Stream<DateTime> get captchaLoadedDateTimeStream;
}
