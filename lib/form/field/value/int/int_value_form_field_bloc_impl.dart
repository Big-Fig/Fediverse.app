// import 'package:fedi/form/field/value/int/int_value_form_field_bloc.dart';
// import 'package:fedi/form/field/value/int/validation/int_value_form_field_min_max_validation.dart';
// import 'package:fedi/form/field/value/int/validation/int_value_form_field_non_empty_validation.dart';
// import 'package:fedi/form/field/value/value_form_field_bloc_impl.dart';
// import 'package:fedi/form/field/value/value_form_field_validation.dart';
// import 'package:flutter/widgets.dart';
//
// class IntValueFormFieldBloc extends ValueFormFieldBloc<int>
//     implements IIntValueFormFieldBloc {
//   @override
//   final int maxValue;
//
//   @override
//   final int minValue;
//
//   @override
//   bool get decimal => true;
//
//   @override
//   final bool signed;
//   @override
//   final FocusNode focusNode = FocusNode();
//
//   @override
//   final TextEditingController textEditingController = TextEditingController();
//
//   IntValueFormFieldBloc({
//     @required int originValue,
//     @required this.signed,
//     this.minValue,
//     this.maxValue,
//     bool isEnabled = true,
//     bool isNullValuePossible = false,
//     @required List<FormValueFieldValidation<int>> validators,
//   }) : super(
//           originValue: originValue,
//           validators: [
//             if (minValue != null || maxValue != null)
//               IntValueFormFieldMinMaxValidationError.createValidator(
//                 minValue: minValue,
//                 maxValue: maxValue,
//               ),
//             if (isNullValuePossible != true)
//               IntValueFormFieldNonEmptyValidationError.createValidator(),
//             ...(validators ?? [])
//           ],
//           isEnabled: isEnabled,
//           isNullValuePossible: isNullValuePossible,
//         ) {
//     var listener = () {
//       var currentInput = textEditingController.text;
//       if (currentInput?.isNotEmpty == true) {
//         try {
//           var currentInputAsInt = int.parse(currentInput);
//           changeCurrentValue(currentInputAsInt);
//         } catch (e) {
//           changeCurrentValue(null);
//         }
//       } else {
//         changeCurrentValue(null);
//       }
//     };
//     addDisposable(textEditingController: textEditingController);
//     addDisposable(focusNode: focusNode);
//     textEditingController.addListener(listener);
//
//     addDisposable(custom: () {
//       textEditingController.removeListener(listener);
//     });
//   }
//
//   @override
//   void changeCurrentValue(int newValue) {
//     if (newValue == currentValue) {
//       return;
//     }
//     super.changeCurrentValue(newValue);
//   }
// }
