import 'package:connectivity/connectivity.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/lifecycle/lifecycle_handler.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger('connection_service_impl.dart');

class ConnectionService extends AsyncInitLoadingBloc
    implements IConnectionService {
  late Connectivity connectivity;

  final BehaviorSubject<ConnectivityResult> _connectionStateSubject =
      BehaviorSubject.seeded(ConnectivityResult.none);

  @override
  Stream<ConnectivityResult> get connectionStateStream =>
      _connectionStateSubject.stream.distinct();

  @override
  ConnectivityResult? get connectionState => _connectionStateSubject.value;

  @override
  Stream<bool> get isConnectedStream =>
      connectionStateStream.map(_mapConnectivityResult).distinct();

  bool _mapConnectivityResult(connectivityResult) =>
      connectivityResult == ConnectivityResult.wifi ||
      connectivityResult == ConnectivityResult.mobile;

  @override
  bool get isConnected => _mapConnectivityResult(connectionState);

  ConnectionService() {
    connectivity = Connectivity();

    var observer = LifecycleEventHandler((state) {
      if (state == AppLifecycleState.resumed) {
        _checkConnectivity();
      }
    });
    WidgetsBinding.instance!.addObserver(observer);
    addDisposable(disposable: CustomDisposable(() async {
      WidgetsBinding.instance!.removeObserver(observer);
    }));

    addDisposable(streamSubscription:
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      _updateConnectivity(connectivityResult);
    }));
  }

  @override
  Future internalAsyncInit() async {
    await _checkConnectivity();
  }

  Future<ConnectivityResult> _checkConnectivity() async {
    var newState = await connectivity.checkConnectivity();
    _updateConnectivity(newState);

    return newState;
  }

  void _updateConnectivity(ConnectivityResult newState) {
    _logger.fine(() => 'newState $newState');

    _connectionStateSubject.add(newState);
  }
}
