// import 'package:fedi/app/ui/form/fedi_form_edit_text_row.dart';
// import 'package:fedi/form/form_item_validation.dart';
// import 'package:flutter/cupertino.dart';
//
// class IntValueFormFieldRowWidget extends StatelessWidget {
//   final String label;
//   final String hint;
//   final int maxLength;
//
//   IntValueFormFieldRowWidget({
//     @required this.label,
//     @required this.hint,
//     @required this.maxLength,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     var formFieldBloc = IIntValueFormFieldBloc.of(context);
//     return StreamBuilder<List<FormItemValidationError>>(
//       stream: formFieldBloc.errorsStream,
//       initialData: formFieldBloc.errors,
//       builder: (context, snapshot) {
//         var errors = snapshot.data;
//
//         var error = errors?.isNotEmpty == true ? errors.first : null;
//
//         return StreamBuilder<bool>(
//           stream: formFieldBloc.isEnabledStream,
//           initialData: formFieldBloc.isEnabled,
//           builder: (context, snapshot) {
//             var isEnabled = snapshot.data;
//             return FediFormEditTextRow(
//               keyboardType: TextInputType.numberWithOptions(
//                 signed: formFieldBloc.signed,
//                 decimal: formFieldBloc.decimal,
//               ),
//               enabled: isEnabled,
//               maxLength: maxLength,
//               hint: hint,
//               label: label,
//               maxLines: 1,
//               autocorrect: false,
//               obscureText: false,
//               textEditingController: formFieldBloc.textEditingController,
//               errorText: error?.createErrorDescription(context),
//               onSubmitted: (_) {},
//               textInputAction: TextInputAction.done,
//               focusNode: formFieldBloc.focusNode,
//             );
//           },
//         );
//       },
//     );
//   }
// }
