import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/ui/switch/custom_switch_bloc.dart';
import 'package:rxdart/rxdart.dart';

class CustomSwitchBloc extends DisposableOwner implements ICustomSwitchBloc {
  final BehaviorSubject<bool> currentValueSubject;

  CustomSwitchBloc({required bool startValue})
      : currentValueSubject = BehaviorSubject.seeded(startValue) {
    currentValueSubject.disposeWith(this);
  }

  @override
  bool? get currentValue => currentValueSubject.valueOrNull;

  @override
  Stream<bool> get currentValueStream => currentValueSubject.stream;

  @override
  void changeValue(bool value) {
    if (currentValue != value) {
      currentValueSubject.add(value);
    }
  }
}
