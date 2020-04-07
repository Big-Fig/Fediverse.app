import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/cupertino.dart';

abstract class IProviderContextBloc extends DisposableOwner {
  T get<T extends Disposable>();

  Disposable register<T extends Disposable>(T object);

  Future<Disposable> asyncInitAndRegister<T extends Disposable>(T obj,
      {Future additionalAsyncInit(T obj)});

  void unregister<T extends Disposable>(T object);

  Widget provideContextToChild({@required Widget child});
}
