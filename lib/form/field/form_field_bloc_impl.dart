import 'package:easy_dispose_rxdart/easy_dispose_rxdart.dart';
import 'package:fedi/form/field/form_field_bloc.dart';
import 'package:fedi/form/form_item_bloc_impl.dart';
import 'package:rxdart/rxdart.dart';

abstract class FormFieldBloc extends FormItemBloc implements IFormFieldBloc {
  final BehaviorSubject<bool> isChangedSubject = BehaviorSubject.seeded(false);

  @override
  bool get isSomethingChanged => isChangedSubject.value;

  @override
  Stream<bool> get isSomethingChangedStream => isChangedSubject.stream;

  final BehaviorSubject<bool> isEnabledSubject;

  @override
  bool get isEnabled => isEnabledSubject.value;

  @override
  Stream<bool> get isEnabledStream => isEnabledSubject.stream;

  FormFieldBloc({
    required bool isEnabled,
  }) : isEnabledSubject = BehaviorSubject.seeded(isEnabled) {
    isEnabledSubject.disposeWith(this);
    isChangedSubject.disposeWith(this);
  }

  @override
  void changeIsEnabled(bool enabled) {
    isEnabledSubject.add(enabled);
  }
}
