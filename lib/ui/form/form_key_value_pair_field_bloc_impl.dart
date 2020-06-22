import 'package:fedi/ui/form/form_field_bloc_impl.dart';
import 'package:fedi/ui/form/form_key_value_pair_field_bloc.dart';
import 'package:fedi/ui/form/form_value_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class FormKeyValuePairFieldBloc<K extends IFormValueFieldBloc,
        V extends IFormValueFieldBloc> extends FormFieldBloc
    implements IFormKeyValuePairFieldBloc<K, V> {
  @override
  final K keyField;
  @override
  final V valueField;

  FormKeyValuePairFieldBloc(
      {@required this.keyField, @required this.valueField}) {
    addDisposable(disposable: keyField);
    addDisposable(disposable: valueField);
  }

  @override
  String toString() {
    return 'FormKeyValuePairFieldBloc{keyField: $keyField,'
        ' valueField: $valueField}';
  }

  @override
  bool get isChanged => keyField.isChanged || valueField.isChanged;

  @override
  Stream<bool> get isChangedStream => Rx.combineLatest2(
      keyField.isChangedStream,
      valueField.isChangedStream,
      (nameIsChanged, valueIsChanged) => nameIsChanged || valueIsChanged);
}
