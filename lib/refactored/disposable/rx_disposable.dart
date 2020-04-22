import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:rxdart/rxdart.dart';

class SubjectDisposable extends CustomDisposable {
  final Subject subject;

  SubjectDisposable(this.subject) : super(() => subject.close());
}
