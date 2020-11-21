import 'package:fedi/form/field/value/string/validation/string_value_form_field_validation.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/widgets.dart';

class PasswordMatchStringValueFormFieldValidationError
    extends StringValueFormFieldValidationError {
  @override
  String createErrorDescription(BuildContext context) =>
      S.of(context).form_field_text_password_error_notMatch_desc;

}
