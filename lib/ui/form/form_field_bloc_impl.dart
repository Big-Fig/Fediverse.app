import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/form/form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

abstract class FormFieldBloc extends DisposableOwner
    implements IFormFieldBloc {
  @override
  bool get isChanged => isChangedSubject.value;

  @override
  Stream<bool> get isChangedStream => isChangedSubject.stream;
  @protected
  // ignore: close_sinks
  BehaviorSubject<bool> isChangedSubject = BehaviorSubject.seeded(false);
  FormFieldBloc() {
    addDisposable(subject: isChangedSubject);
  }
}