import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_rxdart/easy_dispose_rxdart.dart';
import 'package:fedi/form/field/value/select_from_list/multi/multi_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:rxdart/rxdart.dart';

abstract class MultiSelectFromListValueFormFieldBloc<T>
    extends SelectFromListValueFormFieldBloc<List<T>>
    implements IMultiSelectFromListValueFormFieldBloc<T> {
  BehaviorSubject<bool> isNeedRebuildActionsSubject =
      BehaviorSubject.seeded(false);

  @override
  Stream<bool> get isNeedRebuildActionsStream =>
      isNeedRebuildActionsSubject.stream;

  MultiSelectFromListValueFormFieldBloc({
    required List<T> originValue,
    required bool isEnabled,
    required bool isNullValuePossible,
    required List<FormValueFieldValidation<List<T>>> validators,
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
        ) {
    currentValueStream.listen((_) {
      isNeedRebuildActionsSubject.add(true);
    }).disposeWith(this);

    isNeedRebuildActionsSubject.add(true);

    // ignore: cascade_invocations
    isNeedRebuildActionsSubject.disposeWith(this);
  }

  @override
  void toggleValue(T value) {
    var currentValueList = currentValue;
    if (currentValueList.contains(value)) {
      // ignore: avoid-ignoring-return-values
      currentValueList.remove(value);
    } else {
      currentValueList.add(value);
    }

    changeCurrentValue([...currentValueList]);
  }
}
