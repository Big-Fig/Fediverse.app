import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/rest/rest_service.dart';
import 'package:rxdart/rxdart.dart';

abstract class IPleromaApi implements IDisposable {
  IRestService get restService;

  Stream<PleromaApiState> get pleromaApiStateStream;

  PleromaApiState get pleromaApiState;

  Stream<bool> get isConnectedStream;

  bool get isConnected;
}

extension IPleromaApiExtension on IPleromaApi {
  Stream<bool> get isApiReadyToUseStream => Rx.combineLatest2(
        pleromaApiStateStream,
        isConnectedStream,
        _mapIsReady,
      ).distinct();

  bool get isApiReadyToUse => _mapIsReady(
        pleromaApiState,
        isConnected,
      );
}

bool _mapIsReady(
  PleromaApiState pleromaState,
  bool isConnected,
) =>
    pleromaState == PleromaApiState.validAuth;

enum PleromaApiState {
  validAuth,
  brokenAuth,
  loggedOut,
}

abstract class IPleromaAuthApi extends IPleromaApi {
  bool get isPleroma;

  bool get isMastodon;
}
