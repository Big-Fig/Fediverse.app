import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi_app/form/field/info/info_form_field_bloc.dart';
import 'package:fedi_app/form/form_item_validation.dart';
import 'package:rxdart/rxdart.dart';

abstract class InfoFormFieldBloc<T> extends AsyncInitLoadingBloc
    implements IInfoFormFieldBloc<T?> {
  BehaviorSubject<T?> currentValueSubject = BehaviorSubject();

  @override
  T? get currentValue => currentValueSubject.valueOrNull;

  @override
  Stream<T?> get currentValueStream => currentValueSubject.stream;

  InfoFormFieldBloc() {
    currentValueSubject.disposeWith(this);
  }

  @override
  void clear() {
    currentValueSubject.add(null);
  }

  @override
  Future<void> internalAsyncInit() async {
    await recalculate();
  }

  @override
  Future<void> recalculate() async {
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
    throw UnsupportedError('You cant change isEnabled for info field');
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
