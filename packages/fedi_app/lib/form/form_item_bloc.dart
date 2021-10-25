import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/form/form_item_validation.dart';
import 'package:rxdart/rxdart.dart';

abstract class IFormItemBloc extends IDisposable {
  bool get isSomethingChanged;

  Stream<bool> get isSomethingChangedStream;

  Stream<List<FormItemValidationError>> get errorsStream;

  List<FormItemValidationError> get errors;

  Stream<bool> get isHaveAtLeastOneErrorStream;

  bool get isHaveAtLeastOneError;

  void clear();
}

extension IFormItemBlocExtension on IFormItemBloc {
  bool get isHaveChangesAndNoErrors =>
      !isHaveAtLeastOneError && isSomethingChanged;

  Stream<bool> get isHaveChangesAndNoErrorsStream => Rx.combineLatest2(
        isHaveAtLeastOneErrorStream,
        isSomethingChangedStream,
        (
          bool isHaveAtLeastOneError,
          bool isSomethingChanged,
        ) =>
            !isHaveAtLeastOneError && isSomethingChanged,
      ).asBroadcastStream();
}
