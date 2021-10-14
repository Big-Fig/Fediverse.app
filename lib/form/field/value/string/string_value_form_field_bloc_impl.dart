import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_flutter/easy_dispose_flutter.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:flutter/widgets.dart';

class StringValueFormFieldBloc extends ValueFormFieldBloc<String>
    implements IStringValueFormFieldBloc {
  @override
  final TextEditingController textEditingController;

  @override
  final FocusNode focusNode = FocusNode();

  @override
  final int? maxLength;

  StringValueFormFieldBloc({
    required String originValue,
    required List<FormValueFieldValidation<String>> validators,
    required this.maxLength,
    bool isEnabled = true,
    bool isNullValuePossible = true,
  })  : textEditingController = TextEditingController(text: originValue),
        super(
          originValue: originValue,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
          isEnabled: isEnabled,
        ) {
    void listener() {
      var currentValue = textEditingController.text;
      changeCurrentValue(currentValue);
    }

    focusNode.disposeWith(this);
    textEditingController.disposeWith(this);

    // ignore: cascade_invocations
    textEditingController.addListener(listener);

    addCustomDisposable(
      () => textEditingController.removeListener(
        listener,
      ),
    );
  }

  @override
  bool isValueChanged(String? newValue, String? originValue) =>
      (newValue ?? '') != (originValue ?? '');

  @override
  void clear() {
    textEditingController.text = originValue;
    super.clear();
  }
}
