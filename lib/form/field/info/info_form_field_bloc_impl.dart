import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/form/field/info/info_form_field_bloc.dart';
import 'package:fedi/form/form_item_validation.dart';
import 'package:rxdart/rxdart.dart';

abstract class InfoFormFieldBloc<T> extends AsyncInitLoadingBloc
    implements IInfoFormFieldBloc<T> {
  BehaviorSubject<T> currentValueSubject = BehaviorSubject();

  @override
  T get currentValue => currentValueSubject.value;

  @override
  Stream<T> get currentValueStream => currentValueSubject.stream;

  InfoFormFieldBloc() {
    addDisposable(subject: currentValueSubject);
  }

  @override
  void clear() {
    currentValueSubject.add(null);
  }

  @override
  Future internalAsyncInit() async {
    await recalculate();
  }

  @override
  Future recalculate() async {
    var currentValue = await calculateCurrentValue();
    currentValueSubject.add(currentValue);
  }

  Future<T> calculateCurrentValue();

  @override
  List<FormItemValidationError> get errors => [];

  @override
  Stream<List<FormItemValidationError>> get errorsStream =>
      Stream.value(errors);

  @override
  void changeIsEnabled(bool enabled) {
    throw UnsupportedError("You can't change isEnabled for info field");
  }

  @override
  bool get isEnabled => false;

  @override
  Stream<bool> get isEnabledStream => Stream.value(isEnabled);

  @override
  bool get isHaveAtLeastOneError => false;

  @override
  Stream<bool> get isHaveAtLeastOneErrorStream =>
      Stream.value(isHaveAtLeastOneError);

  @override
  bool get isSomethingChanged => false;

  @override
  Stream<bool> get isSomethingChangedStream => Stream.value(isSomethingChanged);
}
