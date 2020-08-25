import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/cupertino.dart';

abstract class IProviderContextBloc extends AsyncInitLoadingBloc {
  T get<T extends Disposable>();

  Disposable register<T extends Disposable>(T object);

  Future<Disposable> asyncInitAndRegister<T extends Disposable>(T obj,
      {Future Function(T obj) additionalAsyncInit});

  void unregister<T extends Disposable>(T object);

  Widget provideContextToChild({@required Widget child});
}
