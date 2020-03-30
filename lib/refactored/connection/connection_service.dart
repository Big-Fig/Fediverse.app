import 'package:connectivity/connectivity.dart';
import 'package:fedi/refactored/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConnectionService implements DisposableOwner,
    IAsyncInitLoadingBloc {
  Stream<ConnectivityResult> get connectionStateStream;

  ConnectivityResult get connectionState;

  Stream<bool> get isConnectedStream;

  bool get isConnected;

  static IConnectionService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IConnectionService>(context, listen: listen);
}
