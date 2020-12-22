import 'package:fedi/disposable/disposable.dart';

abstract class IDatabaseService implements IDisposable {
  Future clear();
  Future delete();
}
