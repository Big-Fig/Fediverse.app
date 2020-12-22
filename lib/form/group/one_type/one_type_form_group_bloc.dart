import 'package:fedi/form/form_item_bloc.dart';
import 'package:fedi/form/group/form_group_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IOneTypeFormGroupBloc<T extends IFormItemBloc>
    extends IFormGroupBloc<T> {
  static IOneTypeFormGroupBloc<T> of<T extends IFormItemBloc>(
          BuildContext context,
          {bool listen = true}) =>
      Provider.of<IOneTypeFormGroupBloc<T>>(context, listen: listen);

  T addNewEmptyField();

  void removeField(T field);

  void changeFields(List<T> fields);

  int get maximumFieldsCount;

  bool get isMaximumFieldsCountReached;

  Stream<bool> get isMaximumFieldsCountReachedStream;

  int get minimumFieldsCount;

  bool get isMinimumFieldsCountReached;

  Stream<bool> get isMinimumFieldsCountReachedStream;

  Stream<bool> get isPossibleToRemoveFieldsStream;

  bool get isPossibleToRemoveFields;

  Stream<bool> get isPossibleToAddFieldsStream;

  bool get isPossibleToAddFields;

  T addNewField(T value);

  void removeAllFields();

  bool isLast(T item);

  T findNextItemFor(T item);

  int indexOf(T item);
}
