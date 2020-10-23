import 'dart:async';

import 'package:fedi/disposable/async_disposable.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/rx_disposable.dart';
import 'package:fedi/disposable/ui_disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class DisposableOwner extends IDisposable {
  bool disposed = false;
  final CompositeDisposable _compositeDisposable = CompositeDisposable([]);

  void addDisposable({
    IDisposable disposable,
    StreamSubscription streamSubscription,
    TextEditingController textEditingController,
    ScrollController scrollController,
    FocusNode focusNode,
    Subject subject,
    StreamController streamController,
    Timer timer,
    VoidCallback custom,
  }) {
    if (disposable != null) {
      _compositeDisposable.children.add(disposable);
    }

    if (subject != null) {
      _compositeDisposable.children.add(SubjectDisposable(subject));
    }

    if (streamController != null) {
      _compositeDisposable.children.add(StreamControllerDisposable(streamController));
    }

    if (timer != null) {
      _compositeDisposable.children.add(TimerDisposable(timer));
    }

    if (streamSubscription != null) {
      _compositeDisposable.children
          .add(StreamSubscriptionDisposable(streamSubscription));
    }

    if (textEditingController != null) {
      _compositeDisposable.children
          .add(TextEditingControllerDisposable(textEditingController));
    }
    if (focusNode != null) {
      _compositeDisposable.children.add(FocusNodeDisposable(focusNode));
    }
    if (scrollController != null) {
      _compositeDisposable.children
          .add(ScrollControllerDisposable(scrollController));
    }
    if (custom != null) {
      _compositeDisposable.children.add(CustomDisposable(custom));
    }
  }

  @override
  @mustCallSuper
  Future dispose() async {
    disposed = true;
    await _compositeDisposable.dispose();
  }
}
