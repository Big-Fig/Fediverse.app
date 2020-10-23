import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/ui/form/form_item_validation.dart';

abstract class IFormItemBloc extends IDisposable {


  bool get isSomethingChanged;

  Stream<bool> get isSomethingChangedStream;

  Stream<List<FormItemValidationError>> get errorsStream;

  List<FormItemValidationError> get errors;

  Stream<bool> get isHaveAtLeastOneErrorStream;

  bool get isHaveAtLeastOneError;

  void clear();
}