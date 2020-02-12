import 'dart:async';

import 'package:fedi/disposable/disposable.dart';

class StreamSubscriptionDisposable extends CustomDisposable {
  final StreamSubscription streamSubscription;

  StreamSubscriptionDisposable(this.streamSubscription)
      : super(() => streamSubscription.cancel());
}

class TimerDisposable extends CustomDisposable {
  final Timer timer;

  TimerDisposable(this.timer) : super(() => timer.cancel());
}
