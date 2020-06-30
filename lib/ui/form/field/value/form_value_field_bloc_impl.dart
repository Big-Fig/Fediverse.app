import 'package:fedi/ui/form/field/form_field_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:fedi/ui/form/field/value/form_value_field_validation.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class FormValueFieldBloc<T> extends FormFieldBloc
    implements IFormValueFieldBloc<T> {
  @override
  final List<FormValueFieldValidation<T>> validators;

  final BehaviorSubject<List<FormValueFieldValidationError>> _currentErrorSubject;

  @override
  List<FormValueFieldValidationError> get errors => _currentErrorSubject.value;

  @override
  Stream<List<FormValueFieldValidationError>> get errorsStream =>
      _currentErrorSubject.stream;

  @override
  final T originValue;

  final BehaviorSubject<T> _currentValueSubject;
  @override
  T get currentValue => _currentValueSubject.value;
  @override
  Stream<T> get currentValueStream => _currentValueSubject.stream;

  FormValueFieldBloc({
    @required this.originValue,
    @required this.validators,
  })  : _currentValueSubject = BehaviorSubject.seeded(originValue),
        _currentErrorSubject =
            BehaviorSubject.seeded(_validate(originValue, validators)) {
    addDisposable(subject: _currentValueSubject);
    addDisposable(subject: _currentErrorSubject);

    addDisposable(streamSubscription: _currentValueSubject.listen((newValue) {
      var changed = isValueChanged(newValue, originValue);
      isChangedSubject.add(changed);
      revalidate();
    }));
  }

  bool isValueChanged(T newValue, T originValue) => newValue != originValue;

  @override
  void changeCurrentValue(T newValue) {
    _currentValueSubject.add(newValue);
  }

  static List<FormValueFieldValidationError> _validate<T>(
      T value, List<FormValueFieldValidation<T>> validators) {
    return validators
            ?.map((validator) => validator(value))
            ?.where((error) => error != null)
            ?.toList() ??
        [];
  }

  void revalidate() {
    _currentErrorSubject.add(_validate(currentValue, validators));

  }

}
