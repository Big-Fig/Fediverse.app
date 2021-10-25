import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:flutter/cupertino.dart';

abstract class IProviderContextBloc extends AsyncInitLoadingBloc {
  T get<T extends IDisposable>();

  IDisposable register<T extends IDisposable>(T object);

  Future<IDisposable> asyncInitAndRegister<T extends IDisposable>(
    T obj, {
    Future<void> Function(T obj)? additionalAsyncInit,
  });

  void unregister<T extends IDisposable>(T object);

  Widget provideContextToChild({required Widget child});
}
