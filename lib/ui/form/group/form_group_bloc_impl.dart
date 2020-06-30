import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/form/form_item_bloc.dart';
import 'package:fedi/ui/form/form_item_bloc_impl.dart';
import 'package:fedi/ui/form/form_item_validation.dart';
import 'package:fedi/ui/form/group/form_group_bloc.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

typedef NewFieldCreator<T> = T Function();

var _logger = Logger("form_group_bloc_impl.dart");

abstract class FormGroupBloc<T extends IFormItemBloc> extends FormItemBloc
    implements IFormGroupBloc<T> {
  @override
  bool get isSomethingChanged => items
          .map((field) => field.isSomethingChanged)
          .fold(false, (previousValue, element) {
        return previousValue || element;
      });

  @override
  Stream<bool> get isSomethingChangedStream =>
      Rx.combineLatestList(items.map((field) => field.isSomethingChangedStream))
          .map((isChangedList) =>
              isChangedList.fold(false, (previousValue, element) {
                return previousValue || element;
              }));

  BehaviorSubject<List<FormItemValidationError>> errorsSubject =
      BehaviorSubject.seeded([]);

  @override
  List<FormItemValidationError> get errors => errorsSubject.value;

  @override
  Stream<List<FormItemValidationError>> get errorsStream =>
      errorsSubject.stream;

  @override
  bool get isHaveAtLeastOneError => errors?.isNotEmpty == true;

  DisposableOwner itemsErrorSubscription;

  @override
  Stream<bool> get isHaveAtLeastOneErrorStream =>
      errorsStream.map((fieldsErrors) => fieldsErrors?.isNotEmpty == true);
  FormGroupBloc() {
    addDisposable(subject: errorsSubject);
    _resubscribeForErrors();
    addDisposable(disposable: itemsErrorSubscription);
    try {
      addDisposable(streamSubscription: itemsStream.listen((newItems) {
        itemsErrorSubscription?.dispose();
        _resubscribeForErrors();
      }));
    } catch (e, stackTrace) {
      _logger.warning(() => "failed to subscribe for items", e, stackTrace);
    }
  }

  void _resubscribeForErrors() {
    itemsErrorSubscription = DisposableOwner();
    items.forEach((IFormItemBloc item) {
      itemsErrorSubscription.addDisposable(
          streamSubscription: item.errorsStream.listen((_) {
        _recalculateErrors();
      }));
    });
  }

  void _recalculateErrors() {
    var errors = items.fold(<FormItemValidationError>[], (errors, item) {
      if (item.errors?.isNotEmpty == true) {
        errors.addAll(item.errors);
      }

      return errors;
    });

    errorsSubject.add(errors);
  }
}
