import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/ui/form/form_string_field_bloc.dart';
import 'package:flutter/widgets.dart';

import 'form_value_field_bloc_impl.dart';

class FormStringFieldBloc extends FormValueFieldBloc<String>
    implements IFormStringFieldBloc {
  @override
  final TextEditingController textEditingController;

  FormStringFieldBloc({@required String originValue})
      : textEditingController = TextEditingController(text: originValue ?? ""),
        super(originValue: originValue) {
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
  bool isValueEqual(String newValue, String originValue) =>
      (newValue ?? "") != (originValue ?? "");
}
