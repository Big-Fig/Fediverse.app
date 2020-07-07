import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/rest/rest_service.dart';
import 'package:rxdart/rxdart.dart';

abstract class IPleromaApi implements Disposable {
  IRestService get restService;
  Stream<PleromaApiState> get pleromaStateStream;

  bool get isPleromaInstance;
  PleromaApiState get pleromaState;

  Stream<bool> get isConnectedStream;

  bool get isConnected;

  Stream<bool> get isApiReadyToUseStream =>
      Rx.combineLatest2(pleromaStateStream, isConnectedStream, mapIsReady)
          .distinct();

  bool get isApiReadyToUse => mapIsReady(pleromaState, isConnected);
}

bool mapIsReady(PleromaApiState pleromaState, bool isConnected) =>
    pleromaState == PleromaApiState.validAuth && isConnected == true;

enum PleromaApiState { validAuth, brokenAuth, loggedOut }
