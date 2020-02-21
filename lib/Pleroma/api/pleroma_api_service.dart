import 'package:rxdart/rxdart.dart';

abstract class IPleromaApi {
  Stream<PleromaApiState> get pleromaStateStream;

  PleromaApiState get pleromaState;

  Stream<bool> get isConnectedStream;

  bool get isConnected;

  Stream<bool> get isApiReadyToUseStream =>
      Rx.combineLatest2(pleromaStateStream, isConnectedStream,
          mapIsReady).distinct();

  bool get isApiReadyoUse => mapIsReady(pleromaState, isConnected);

}

bool mapIsReady(PleromaApiState pleromaState, bool isConnected) =>
    pleromaState == PleromaApiState.validAuth && isConnected == true;

enum PleromaApiState { validAuth, brokenAuth, loggedOut }
