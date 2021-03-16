import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:flutter/widgets.dart';

class StringValueFormFieldBloc extends ValueFormFieldBloc<String?>
    implements IStringValueFormFieldBloc {
  @override
  final TextEditingController textEditingController;

  @override
  final FocusNode focusNode = FocusNode();

  @override
  final int? maxLength;

  StringValueFormFieldBloc({
    required String? originValue,
    required List<FormValueFieldValidation<String>> validators,
    required this.maxLength,
    bool? isEnabled = true,
    bool isNullValuePossible = true,
  })  : textEditingController = TextEditingController(text: originValue ?? ""),
        super(
          originValue: originValue,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
        ) {
    var listener = () {
      var currentValue = textEditingController.text;
      changeCurrentValue(currentValue);
    };

    addDisposable(focusNode: focusNode);

    addDisposable(textEditingController: textEditingController);
    textEditingController.addListener(listener);
    addDisposable(
      disposable: CustomDisposable(
        () async {
          textEditingController.removeListener(listener);
        },
      ),
    );
  }

  @override
  bool isValueChanged(String? newValue, String? originValue) =>
      (newValue ?? "") != (originValue ?? "");

  @override
  void clear() {
    textEditingController.text = originValue ?? "";
    super.clear();
  }
}
