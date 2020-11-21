import 'package:fedi/generated/l10n.dart';
import 'package:fedi/form/field/value/string/form_string_field_validation.dart';
import 'package:flutter/widgets.dart';

class FormPasswordMatchStringFieldValidation
    extends FormStringFieldValidationError {
  @override
  String createErrorDescription(BuildContext context) =>
      S.of(context).form_field_text_password_error_notMatch_desc;

}
