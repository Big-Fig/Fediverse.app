import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/ui/form/form_field_bloc.dart';

abstract class IFormBloc extends Disposable {
  List<IFormFieldBloc> get allFields;

  bool get isSomethingChanged;

  Stream<bool> get isSomethingChangedStream;


}