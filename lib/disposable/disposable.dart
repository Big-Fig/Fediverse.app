import 'dart:async';

import 'package:flutter/widgets.dart';

abstract class IDisposable {
  bool get isDisposed;

  @mustCallSuper
  Future dispose();
}


class CustomDisposable extends IDisposable {
  final FutureOr Function() _disposeCallback;

  @override
  bool isDisposed = false;

  CustomDisposable(this._disposeCallback);

  @override
  Future dispose() async {
    if (isDisposed) {
      return;
    }
    isDisposed = true;
    return await _disposeCallback();
  }
}

class CompositeDisposable extends CustomDisposable {
  final List<IDisposable> children;

  CompositeDisposable(this.children)
      : super(() async {
          // reversed for LIFO
          for (var child in children.reversed) {
            await child.dispose();
          }
        });

  void add(IDisposable disposable) => children.add(disposable);
}
