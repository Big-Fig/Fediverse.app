import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:fedi/ui/form/form_item_bloc.dart';
import 'package:fedi/ui/form/group/form_group_bloc_impl.dart';
import 'package:fedi/ui/form/group/pair/form_key_value_pair_field_group_bloc.dart';
import 'package:flutter/widgets.dart';

class FormKeyValuePairFieldGroupBloc<K extends IFormValueFieldBloc,
        V extends IFormValueFieldBloc> extends FormGroupBloc
    implements IFormKeyValuePairFieldGroupBloc<K, V> {
  @override
  final K keyField;
  @override
  final V valueField;

  FormKeyValuePairFieldGroupBloc(
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
  List<IFormItemBloc> get items => [keyField, valueField];

  @override
  Stream<List<IFormItemBloc>> get itemsStream => Stream.value(items);
}
