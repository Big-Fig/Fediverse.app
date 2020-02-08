import 'package:flutter/widgets.dart';

abstract class Disposable {
  @mustCallSuper
  void dispose();
}

class CustomDisposable extends Disposable {
  final VoidCallback _disposeCallback;

  CustomDisposable(this._disposeCallback);

  @override
  void dispose() => _disposeCallback();
}

class CompositeDisposable extends CustomDisposable {
  final List<Disposable> children;

  CompositeDisposable(this.children)
      : super(() {
          children.forEach((child) => child.dispose());
        });

  void add(Disposable disposable) => children.add(disposable);
}





