import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_validation.dart';
import 'package:flutter/widgets.dart';

class FormPasswordMatchStringFieldValidation
    extends FormStringFieldValidationError {
  @override
  String createErrorDescription(BuildContext context) =>
      tr("form.field.text.password.error.not_match.desc");

}
