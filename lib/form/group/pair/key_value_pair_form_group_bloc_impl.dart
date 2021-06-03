import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:fedi/form/group/form_group_bloc_impl.dart';
import 'package:fedi/form/group/pair/key_value_pair_form_group_bloc.dart';

class KeyValuePairFormGroupBloc<K extends IValueFormFieldBloc,
        V extends IValueFormFieldBloc> extends FormGroupBloc
    implements IKeyValuePairFormGroupBloc<K, V> {
  @override
  final K keyField;
  @override
  final V valueField;

  KeyValuePairFormGroupBloc({
    required this.keyField,
    required this.valueField,
  }) {
    addDisposable(disposable: keyField);
    addDisposable(disposable: valueField);
  }

  @override
  String toString() {
    return 'FormKeyValuePairFieldBloc{'
        'keyField: $keyField, '
        'valueField: $valueField'
        '}';
  }

  @override
  List<IFormItemBloc> get items => [keyField, valueField];

  @override
  Stream<List<IFormItemBloc>> get itemsStream => Stream.value(items);

  @override
  void clear() {
    keyField.clear();
    valueField.clear();
  }
}
