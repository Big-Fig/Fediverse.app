import 'package:fedi/form/field/value/string/validation/string_value_form_field_validation.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/widgets.dart';

class UrlStringValueFormFieldValidationError
    extends StringValueFormFieldValidationError {
  static final urlRegex = RegExp(
    r'(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)',
  );

  @override
  String createErrorDescription(BuildContext context) =>
      S.of(context).form_field_text_url_error_invalid_desc;

  static FormValueFieldValidation createValidator() => (currentValue) {
        bool emailValid = urlRegex.hasMatch(currentValue ?? '');
        if (emailValid) {
          return null;
        } else {
          return UrlStringValueFormFieldValidationError();
        }
      };
}
