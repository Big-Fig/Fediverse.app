// import 'package:fedi/form/field/value/int/validation/int_value_form_field_validation.dart';
// import 'package:fedi/form/field/value/value_form_field_validation.dart';
// import 'package:fedi/generated/l10n.dart';
// import 'package:flutter/widgets.dart';
//
// class IntValueFormFieldMinMaxValidationError
//     extends IntValueFormFieldValidationError {
//   final int minValue;
//   final int maxValue;
//
//   IntValueFormFieldMinMaxValidationError({
//     @required this.minValue,
//     @required this.maxValue,
//   }) {
//     assert(minValue != null || maxValue != null);
//   }
//
//   @override
//   String createErrorDescription(BuildContext context) {
//     if (minValue != null && maxValue != null) {
//       return S.of(context).form_field_int_error_length_minAndMax_desc(
//             minValue,
//             maxValue,
//           );
//     } else if (minValue != null) {
//       return S
//           .of(context)
//           .form_field_int_error_length_minOnlyValue_desc(minValue);
//     } else if (maxValue != null) {
//       return S
//           .of(context)
//           .form_field_int_error_length_maxOnlyValue_desc(maxValue);
//     } else {
//       return null;
//     }
//   }
//
//   static FormValueFieldValidation<int> createValidator(
//           {@required int minValue, @required int maxValue}) =>
//       (int currentValue) {
//         if (currentValue == null) {
//           return null;
//         }
//         assert(minValue != null || maxValue != null);
//         bool moreThanMin;
//         if (minValue != null) {
//           moreThanMin = currentValue >= (minValue);
//         } else {
//           moreThanMin = true;
//         }
//         bool lessThanMax;
//         if (maxValue != null) {
//           lessThanMax = currentValue < maxValue;
//         } else {
//           lessThanMax = true;
//         }
//
//         if (moreThanMin && lessThanMax) {
//           return null;
//         } else {
//           return IntValueFormFieldMinMaxValidationError(
//               minValue: minValue, maxValue: maxValue);
//         }
//       };
// }
