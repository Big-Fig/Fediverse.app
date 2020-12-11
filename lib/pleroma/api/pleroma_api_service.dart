import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/rest/rest_service.dart';
import 'package:rxdart/rxdart.dart';

abstract class IPleromaApi implements IDisposable {
  IRestService get restService;
  Stream<PleromaApiState> get pleromaApiStateStream;

  bool get isPleromaInstance;
  PleromaApiState get pleromaApiState;

  Stream<bool> get isConnectedStream;

  bool get isConnected;

  Stream<bool> get isApiReadyToUseStream =>
      Rx.combineLatest2(pleromaApiStateStream, isConnectedStream, mapIsReady)
          .distinct();

  bool get isApiReadyToUse => mapIsReady(pleromaApiState, isConnected);
}

bool mapIsReady(PleromaApiState pleromaState, bool isConnected) =>
    pleromaState == PleromaApiState.validAuth && isConnected == true;

enum PleromaApiState { validAuth, brokenAuth, loggedOut }
