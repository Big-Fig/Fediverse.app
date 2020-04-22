import 'dart:async';

import 'package:fedi/refactored/disposable/async_disposable.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/disposable/rx_disposable.dart';
import 'package:fedi/refactored/disposable/ui_disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class DisposableOwner extends Disposable {
  bool disposed = false;
  final CompositeDisposable _compositeDisposable = CompositeDisposable([]);

  void addDisposable(
      {Disposable disposable,
      StreamSubscription streamSubscription,
      TextEditingController textEditingController,
      FocusNode focusNode,
      Subject subject,
      Timer timer}) {
    if (disposable != null) {
      _compositeDisposable.children.add(disposable);
    }

    if (subject != null) {
      _compositeDisposable.children.add(SubjectDisposable(subject));
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
  }

  @mustCallSuper
  void dispose() {
    disposed = true;
    _compositeDisposable.dispose();
  }
}
