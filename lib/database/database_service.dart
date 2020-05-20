import 'package:fedi/disposable/disposable.dart';

abstract class IDatabaseService implements Disposable {
  Future clear();
}
