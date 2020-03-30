import 'package:fedi/refactored/disposable/disposable.dart';

abstract class IDatabaseService implements Disposable {
  Future clear();
}
