import 'package:fedi/disposable/disposable.dart';
import 'package:rxdart/rxdart.dart';

abstract class IPleromaApi implements Disposable {
  Stream<PleromaApiState> get pleromaStateStream;

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
