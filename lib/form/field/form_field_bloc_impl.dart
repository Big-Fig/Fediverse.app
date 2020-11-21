import 'package:fedi/form/field/form_field_bloc.dart';
import 'package:fedi/form/form_item_bloc_impl.dart';
import 'package:rxdart/rxdart.dart';

abstract class FormFieldBloc extends FormItemBloc implements IFormFieldBloc {
  final BehaviorSubject<bool> isChangedSubject = BehaviorSubject.seeded(false);

  @override
  bool get isSomethingChanged => isChangedSubject.value;

  @override
  Stream<bool> get isSomethingChangedStream => isChangedSubject.stream;

  FormFieldBloc() {
    addDisposable(subject: isChangedSubject);
  }
}
