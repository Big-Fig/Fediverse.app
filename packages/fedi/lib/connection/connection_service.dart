import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_dispose/easy_dispose.dart';

abstract class IConnectionService implements DisposableOwner {
  Stream<ConnectivityResult> get connectionStateStream;

  ConnectivityResult? get connectionState;

  Stream<bool> get isConnectedStream;

  bool get isConnected;

  Future<void> internalAsyncInit();
}
