import 'package:fedi_app/form/field/value/value_form_field_bloc.dart';
import 'package:fedi_app/form/form_item_bloc.dart';
import 'package:fedi_app/form/group/form_group_bloc_impl.dart';
import 'package:fedi_app/form/group/pair/key_value_pair_form_group_bloc.dart';

class KeyValuePairFormGroupBloc<K extends IValueFormFieldBloc<dynamic>,
        V extends IValueFormFieldBloc<dynamic>> extends FormGroupBloc
    implements IKeyValuePairFormGroupBloc<K, V> {
  @override
  final K keyField;
  @override
  final V valueField;

  KeyValuePairFormGroupBloc({
    required this.keyField,
    required this.valueField,
  }) {
    addDisposable(keyField);
    addDisposable(valueField);
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
