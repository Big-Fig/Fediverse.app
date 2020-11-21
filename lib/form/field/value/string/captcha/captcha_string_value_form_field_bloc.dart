import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';

abstract class ICaptchaStringFormFieldBloc extends IStringValueFormFieldBloc {
  Stream<Image> get captchaImageStream;

  Future reloadCaptcha();
}
