import 'package:flutter/widgets.dart';

abstract class IDisposable {
  @mustCallSuper
  Future dispose();
}

class CustomDisposable extends IDisposable {
  final Future Function() _disposeCallback;

  CustomDisposable(this._disposeCallback);

  @override
  Future dispose() async => _disposeCallback();
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
