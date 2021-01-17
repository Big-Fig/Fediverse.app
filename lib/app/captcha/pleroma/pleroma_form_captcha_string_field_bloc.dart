import 'dart:async';

import 'package:fedi/app/captcha/captcha_string_value_form_field_bloc.dart';

abstract class IPleromaFormCaptchaStringFieldBloc
    implements ICaptchaStringValueFormFieldBloc {
  DateTime get captchaLoadedDateTime;

  Stream<DateTime> get captchaLoadedDateTimeStream;
}
