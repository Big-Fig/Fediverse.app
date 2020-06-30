import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/ui/form/field/value/form_value_field_validation.dart';
import 'package:flutter/widgets.dart';

import 'package:fedi/ui/form/field/value/form_value_field_bloc_impl.dart';

class FormStringFieldBloc extends FormValueFieldBloc<String>
    implements IFormStringFieldBloc {
  @override
  final TextEditingController textEditingController;

  FormStringFieldBloc(
      {@required String originValue,
      @required List<FormValueFieldValidation<String>> validators})
      : textEditingController = TextEditingController(text: originValue ?? ""),
        super(
          originValue: originValue,
          validators: validators,
        ) {
    var listener = () {
      var currentValue = textEditingController.text;
      changeCurrentValue(currentValue);
    };
    addDisposable(textEditingController: textEditingController);
    textEditingController.addListener(listener);
    addDisposable(disposable: CustomDisposable(() {
      textEditingController.removeListener(listener);
    }));
  }

  @override
  bool isValueChanged(String newValue, String originValue) =>
      (newValue ?? "") != (originValue ?? "");
}
