import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DisposableProvider<T extends IDisposable> extends Provider<T> {
  DisposableProvider({
    Key? key,
    required Create<T> create,
    bool? lazy,
    Widget? child,
  }) : super(
            key: key,
            create: create,
            lazy: lazy,
            child: child,
            dispose: (_, disposable) => disposable.dispose());
}

class DisposableProxyProvider<T, R extends IDisposable>
    extends ProxyProvider<T, R> {
  DisposableProxyProvider({
    Key? key,
    Create<R>? create,
    required ProxyProviderBuilder<T, R> update,
    UpdateShouldNotify<R>? updateShouldNotify,
    Dispose<R>? dispose,
    bool? lazy,
    Widget? child,
  }) : super(
            key: key,
            create: create,
            update: update,
            updateShouldNotify: updateShouldNotify,
            lazy: lazy,
            child: child,
            dispose: (_, disposable) => disposable.dispose());
}

class DisposableProxyProvider2<T, K, R extends IDisposable>
    extends ProxyProvider2<T, K, R> {
  DisposableProxyProvider2({
    Key? key,
    Create<R>? create,
    required ProxyProviderBuilder2<T, K, R> update,
    UpdateShouldNotify<R>? updateShouldNotify,
    Dispose<R>? dispose,
    bool? lazy,
    Widget? child,
  }) : super(
            key: key,
            create: create,
            update: update,
            updateShouldNotify: updateShouldNotify,
            lazy: lazy,
            child: child,
            dispose: (_, disposable) => disposable.dispose());
}
