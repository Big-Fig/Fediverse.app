import 'package:fedi/ui/form/form_field_bloc_impl.dart';
import 'package:fedi/ui/form/form_value_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class FormValueFieldBloc<T>  extends FormFieldBloc implements IFormValueFieldBloc<T>{
  @override
  final T originValue;

  final BehaviorSubject<T> _currentValueSubject;
  @override
  T get currentValue => _currentValueSubject.value;
  @override
  Stream<T> get currentValueStream => _currentValueSubject.stream;

  FormValueFieldBloc({@required this.originValue})
      : _currentValueSubject = BehaviorSubject.seeded(originValue) {
    addDisposable(subject: _currentValueSubject);
    addDisposable(streamSubscription: _currentValueSubject.listen((newValue) {
      isChangedSubject.add(isValueEqual(newValue, originValue));
    }));
  }

  bool isValueEqual(T newValue, T originValue) => newValue != originValue;

  @override
  void changeCurrentValue(T newValue) {
    _currentValueSubject.add(newValue);
  }
}
