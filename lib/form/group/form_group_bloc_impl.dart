import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:fedi/form/form_item_bloc_impl.dart';
import 'package:fedi/form/form_item_validation.dart';
import 'package:fedi/form/group/form_group_bloc.dart';
import 'package:rxdart/rxdart.dart';

typedef NewFieldCreator<T> = T Function();

abstract class FormGroupBloc<T extends IFormItemBloc> extends FormItemBloc
    implements IFormGroupBloc<T> {
  BehaviorSubject<bool> isSomethingChangedSubject =
      BehaviorSubject.seeded(false);

  FormGroupBloc() {
    addDisposable(subject: errorsSubject);
    addDisposable(subject: isSomethingChangedSubject);

    addDisposable(custom: () {
      itemsErrorSubscription?.dispose();
    });
    addDisposable(custom: () {
      isSomethingChangedSubscription?.dispose();
    });

    addDisposable(
      streamSubscription: itemsStream.listen(
        (newItems) {
          _subscribeForErrors(newItems);
          _subscribeForIsSomethingChanged(newItems);
        },
      ),
    );
  }

  @override
  bool get isSomethingChanged => isSomethingChangedSubject.value!;

  @override
  Stream<bool> get isSomethingChangedStream => isSomethingChangedSubject.stream;

  BehaviorSubject<List<FormItemValidationError>> errorsSubject =
      BehaviorSubject.seeded([]);

  @override
  List<FormItemValidationError> get errors => errorsSubject.value!;

  @override
  Stream<List<FormItemValidationError>> get errorsStream =>
      errorsSubject.stream;

  @override
  bool get isHaveAtLeastOneError => errors?.isNotEmpty == true;

  DisposableOwner? itemsErrorSubscription;
  DisposableOwner? isSomethingChangedSubscription;

  @override
  Stream<bool> get isHaveAtLeastOneErrorStream =>
      errorsStream.map((fieldsErrors) => fieldsErrors?.isNotEmpty == true);

  void _subscribeForErrors(List<T>? newItems) {
    itemsErrorSubscription?.dispose();
    itemsErrorSubscription = DisposableOwner();

    if (!errorsSubject.isClosed) {
      errorsSubject.add([]);
    }

    if (newItems?.isNotEmpty == true) {
      newItems!.forEach(
        (IFormItemBloc item) {
          itemsErrorSubscription!.addDisposable(
            streamSubscription: item.errorsStream.listen(
              (_) {
                recalculateErrors();
              },
            ),
          );
        },
      );
    }
  }

  void _subscribeForIsSomethingChanged(List<T>? newItems) {
    isSomethingChangedSubscription = DisposableOwner();

    if (!isSomethingChangedSubject.isClosed) {
      isSomethingChangedSubject.add(false);
    }

    if (newItems?.isNotEmpty == true) {
      newItems!.forEach(
        (IFormItemBloc item) {
          isSomethingChangedSubscription!.addDisposable(
            streamSubscription: item.isSomethingChangedStream.listen(
              (_) {
                recalculateIsSomethingChanged();
              },
            ),
          );
        },
      );
    }
  }

  void recalculateErrors() {
    var errors =
        items.fold(<FormItemValidationError>[], (dynamic errors, item) {
      if (item.errors?.isNotEmpty == true) {
        errors.addAll(item.errors);
      }

      return errors;
    });

    if (!errorsSubject.isClosed) {
      errorsSubject.add(errors);
    }
  }

  void recalculateIsSomethingChanged() {
    var isSomethingChanged = items.map((item) => item.isSomethingChanged).fold(
      false,
      (dynamic previousValue, element) {
        return previousValue || element;
      },
    );

    if (!isSomethingChangedSubject.isClosed) {
      isSomethingChangedSubject.add(isSomethingChanged);
    }
  }
}
