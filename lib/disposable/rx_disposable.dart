import 'dart:async';

import 'package:fedi/disposable/disposable.dart';
import 'package:rxdart/rxdart.dart';

class SubjectDisposable extends CustomDisposable {
  final Subject subject;

  SubjectDisposable(this.subject) : super(() => subject.close());
}

class StreamControllerDisposable extends CustomDisposable {
  final StreamController streamController;

  StreamControllerDisposable(this.streamController)
      : super(() => streamController.close());
}
