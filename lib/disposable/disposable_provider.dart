import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DisposableProvider<T extends Disposable> extends Provider<T> {
  DisposableProvider({
    Key key,
    @required Create<T> create,
    bool lazy,
    Widget child,
  }) : super(
            key: key,
            create: create,
            lazy: lazy,
            child: child,
            dispose: (_, disposable) => disposable.dispose());
}
