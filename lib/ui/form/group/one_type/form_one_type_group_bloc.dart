import 'package:fedi/ui/form/form_item_bloc.dart';
import 'package:fedi/ui/form/group/form_group_bloc.dart';

abstract class IFormOneTypeGroupBloc<T extends IFormItemBloc>
    extends IFormGroupBloc<T> {
  T addNewEmptyField();

  void removeField(T field);

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
}
