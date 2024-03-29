import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi_app/provider/provider_context_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart' as provider_lib;

// ignore_for_file: avoid-ignoring-return-values
var _logger = Logger('provider_context_bloc_impl.dart');

typedef ProviderBuilder<T extends IDisposable> = provider_lib.Provider<T>
    Function();

class DisposableEntry<T extends IDisposable> {
  T disposable;
  ProviderBuilder<T> providerBuilder;

  DisposableEntry(this.disposable, this.providerBuilder);
}

abstract class ProviderContextBloc extends AsyncInitLoadingBloc
    implements IProviderContextBloc {
  final Map<Type, DisposableEntry> _storage = {};

  @override
  IDisposable register<T extends IDisposable>(T disposable) {
    var type = T;
    if (_storage.containsKey(type)) {
      throw ArgumentError(
        'Cant register $IDisposable because {$type} already registered',
      );
    }

    provider_lib.Provider<T> providerCreator() =>
        provider_lib.Provider<T>.value(
          value: disposable,
        );

    _storage[type] = DisposableEntry<T>(disposable, providerCreator);

    return CustomDisposable(() async => unregister<T>(disposable));
  }

  @override
  Future<void> unregister<T extends IDisposable>(T object) async {
    var type = T;
    if (!_storage.containsKey(type)) {
      throw ArgumentError(
        'Cant unregister $object because {$type} not registered',
      );
    }

    var objInStorage = _storage[type]!;
    if (objInStorage != object) {
      throw ArgumentError(
        'Cant unregister $object because obj {$object} not equal to '
        'registered $objInStorage',
      );
    }

    await objInStorage.disposable.dispose();

    _storage.remove(type);
  }

  @override
  Widget provideContextToChild({required Widget child}) {
    _logger.fine(() => 'provideToChildContext ${_storage.length}');

    var providers =
        _storage.values.map((entry) => entry.providerBuilder()).toList();

    return provider_lib.MultiProvider(
      providers: providers,
      child: child,
    );
  }

  @override
  Future<IDisposable> asyncInitAndRegister<T extends IDisposable>(
    T obj, {
    Future<void> Function(T obj)? additionalAsyncInit,
  }) async {
    if (obj is AsyncInitLoadingBloc) {
      await obj.performAsyncInit();
    }

    if (additionalAsyncInit != null) {
      await additionalAsyncInit(obj);
    }

    return register<T>(obj);
  }

  @override
  T get<T extends IDisposable>() => _storage[T]!.disposable as T;
}
