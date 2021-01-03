// import 'package:fedi/form/field/value/int/validation/int_value_form_field_validation.dart';
// import 'package:fedi/form/field/value/value_form_field_validation.dart';
// import 'package:fedi/generated/l10n.dart';
// import 'package:flutter/widgets.dart';
//
// class IntValueFormFieldNonEmptyValidationError
//     extends IntValueFormFieldValidationError {
//   @override
//   String createErrorDescription(BuildContext context) =>
//       S.of(context).form_field_text_error_empty_desc;
//
//   static FormValueFieldValidation createValidator() => (currentValue) {
//         if (currentValue?.isNotEmpty == true) {
//           return null;
//         } else {
//           return IntValueFormFieldNonEmptyValidationError();
//         }
//       };
// }
