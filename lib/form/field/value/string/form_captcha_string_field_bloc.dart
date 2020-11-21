import 'package:fedi/form/field/value/string/form_string_field_bloc.dart';
import 'package:flutter/widgets.dart';

abstract class IFormCaptchaStringFieldBloc extends IFormStringFieldBloc {
  Stream<Image> get captchaImageStream;

  Future reloadCaptcha();
}
