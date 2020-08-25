import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/switch/custom_switch_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class CustomSwitchBloc extends DisposableOwner implements ICustomSwitchBloc {
  final BehaviorSubject<bool> currentValueSubject;

  CustomSwitchBloc({@required startValue})
      : currentValueSubject = BehaviorSubject.seeded(startValue) {
    addDisposable(subject: currentValueSubject);
  }

  @override
  bool get currentValue => currentValueSubject.value;

  @override
  Stream<bool> get currentValueStream => currentValueSubject.stream;

  @override
  void changeValue(bool value) {
    if (currentValue != value) {
      currentValueSubject.add(value);
    }
  }
}
