
import 'package:fedi/disposable/disposable.dart';

abstract class IFormFieldBloc extends Disposable {
  bool get isChanged;

  Stream<bool> get isChangedStream;
}