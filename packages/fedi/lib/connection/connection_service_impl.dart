import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger('connection_service_impl.dart');

class ConnectionService extends DisposableOwner implements IConnectionService {
  final Connectivity connectivity = Connectivity();

  final BehaviorSubject<ConnectivityResult> _connectionStateSubject =
      BehaviorSubject.seeded(ConnectivityResult.none);

  @override
  Stream<ConnectivityResult> get connectionStateStream =>
      _connectionStateSubject.stream.distinct();

  @override
  ConnectivityResult? get connectionState =>
      _connectionStateSubject.valueOrNull;

  @override
  Stream<bool> get isConnectedStream =>
      connectionStateStream.map(_mapConnectivityResult).distinct();

  bool _mapConnectivityResult(ConnectivityResult? connectivityResult) =>
      connectivityResult == ConnectivityResult.wifi ||
      connectivityResult == ConnectivityResult.mobile;

  @override
  bool get isConnected => _mapConnectivityResult(connectionState);

  ConnectionService() {
    connectivity.onConnectivityChanged
        .listen(
          _updateConnectivity,
        )
        .disposeWith(this);
  }

  @override
  Future<void> internalAsyncInit() async {
    await _checkConnectivity();
  }

  Future<void> _checkConnectivity() async {
    var newState = await connectivity.checkConnectivity();
    _updateConnectivity(newState);
  }

  void _updateConnectivity(ConnectivityResult newState) {
    _logger.fine(() => 'newState $newState');

    _connectionStateSubject.add(newState);
  }
}
