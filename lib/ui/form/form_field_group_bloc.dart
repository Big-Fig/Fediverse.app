import 'package:fedi/ui/form/form_field_bloc.dart';

abstract class IFormFieldGroupBloc<T extends IFormFieldBloc>
    extends IFormFieldBloc {
  void addNewEmptyCustomField();

  void removeCustomField(T field);


  List<T> get fields;

  Stream<List<T>> get fieldsStream;

  int get maximumFieldsCount;

  bool get isMaximumCustomFieldsCountReached;

  Stream<bool> get isMaximumCustomFieldsCountReachedStream;


}
