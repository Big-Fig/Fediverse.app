import 'package:fedi/form/field/value/select_from_list/select_from_list_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMultiSelectFromListValueFormFieldBloc<T>
    implements ISelectFromListValueFormFieldBloc<List<T>> {
  static IMultiSelectFromListValueFormFieldBloc<T> of<T>(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IMultiSelectFromListValueFormFieldBloc<T>>(context,
          listen: listen);

  List<T> get possibleValues;
  
  Stream<bool> get isNeedRebuildActionsStream;

  void toggleValue(T value);
}
