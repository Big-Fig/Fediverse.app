import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/form/form_model.dart';
import 'package:flutter/cupertino.dart';

abstract class FormFieldError {
  String createErrorDescription(BuildContext context);
}

abstract class FormTextFieldError extends FormFieldError {}

class EmptyFormTextFieldError extends FormTextFieldError {
  @override
  String createErrorDescription(BuildContext context) =>
      tr("form.field.text.error.empty.desc");

  static FormFieldErrorValidator createValidator() => (currentValue) {
        if (currentValue?.isNotEmpty == true) {
          return null;
        } else {
          return EmptyFormTextFieldError();
        }
      };
}

class InvalidLengthFormTextFieldError extends FormTextFieldError {
  final int minLength;
  final int maxLength;

  InvalidLengthFormTextFieldError(
      {@required this.minLength, @required this.maxLength}) {
    assert(minLength != null || maxLength != null);
  }

  @override
  String createErrorDescription(BuildContext context) {
    if (minLength != null && maxLength != null) {
      return tr(
          "form.field.text.error.length.min_and_max.desc",
          args: [minLength.toString(), maxLength.toString()]);
    } else if (minLength != null) {
      return tr(
          "form.field.text.error.length.min_only.desc",
          args: [minLength.toString()]);
    } else if (maxLength != null) {}
    return tr(
        "form.field.text.error.length.max_only.desc",
        args: [maxLength.toString()]);
  }

  static FormFieldErrorValidator createValidator(
          {@required int minLength, @required int maxLength}) =>
      (currentValue) {
        assert(minLength != null || maxLength != null);
        var length = currentValue?.length ?? 0;
        bool moreThanMin;
        if (minLength != null) {
          moreThanMin = length >= (minLength);
        } else {
          moreThanMin = true;
        }
        bool lessThanMax;
        if (maxLength != null) {
          lessThanMax = length < maxLength;
        } else {
          lessThanMax = true;
        }

        if (moreThanMin && lessThanMax) {
          return null;
        } else {
          return InvalidLengthFormTextFieldError(
              minLength: minLength, maxLength: maxLength);
        }
      };
}

class InvalidEmailFormTextFieldError extends FormTextFieldError {
  static final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  String createErrorDescription(BuildContext context) =>
      tr("form.field.text.email.error.invalid.desc");

  static FormFieldErrorValidator createValidator() => (currentValue) {
        bool emailValid = emailRegex.hasMatch(currentValue ?? "");
        if (emailValid) {
          return null;
        } else {
          return InvalidEmailFormTextFieldError();
        }
      };
}

class PasswordNotMatchFormTextFieldError extends FormTextFieldError {
  @override
  String createErrorDescription(BuildContext context) =>
      tr("form.field.text.password.error.not_match.desc");
}
