import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/auth/instance/current/context/init/current_auth_instance_context_init_bloc.dart';
import 'package:fedi/app/auth/instance/current/context/init/current_auth_instance_context_init_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_service.dart';
import 'package:fedi/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("current_auth_instance_context_init_bloc_impl.dart");

class CurrentAuthInstanceContextInitBloc extends AsyncInitLoadingBloc
    implements ICurrentAuthInstanceContextInitBloc {
  final IMyAccountBloc myAccountBloc;
  final IPleromaInstanceService pleromaInstanceService;
  final ICurrentAuthInstanceBloc currentAuthInstanceBloc;
  final IPleromaAuthRestService pleromaAuthRestService;

  CurrentAuthInstanceContextInitBloc({
    @required this.myAccountBloc,
    @required this.pleromaInstanceService,
    @required this.currentAuthInstanceBloc,
    @required this.pleromaAuthRestService,
  }) {
    addDisposable(subject: stateSubject);

    addDisposable(
      streamSubscription: pleromaAuthRestService.pleromaApiStateStream.listen(
        (pleromaApiState) {
          _logger.finest(() => "pleromaApiState $pleromaApiState");
          if (pleromaApiState == PleromaApiState.brokenAuth) {
            _logger.finest(() =>
                " stateSubject.add(CurrentAuthInstanceContextInitState.invalidCredentials)");
            stateSubject
                .add(CurrentAuthInstanceContextInitState.invalidCredentials);
          }
        },
      ),
    );
  }

  @override
  Future refreshFromNetwork() async {
    stateSubject.add(CurrentAuthInstanceContextInitState.loading);
    var isConnected = pleromaInstanceService.isConnected;
    _logger.finest(() => "refresh isApiReadyToUse $isConnected");

    try {
      await myAccountBloc.refreshFromNetwork(isNeedPreFetchRelationship: false);

      var info = await pleromaInstanceService.getInstance();
      var currentInstance = currentAuthInstanceBloc.currentInstance;
      currentInstance = currentInstance.copyWith(info: info);
      await currentAuthInstanceBloc.changeCurrentInstance(currentInstance);

      if (myAccountBloc.isLocalCacheExist) {
        stateSubject.add(CurrentAuthInstanceContextInitState.localCacheExist);
      } else {
        stateSubject.add(
            CurrentAuthInstanceContextInitState.cantFetchAndLocalCacheNotExist);
      }
    } catch (e, stackTrace) {
      _logger.warning(() => "failed to update instance info", e, stackTrace);
      if (e is PleromaInvalidCredentialsForbiddenRestException) {
        stateSubject
            .add(CurrentAuthInstanceContextInitState.invalidCredentials);
        rethrow;
      } else {
        if (myAccountBloc.isLocalCacheExist) {
          stateSubject.add(CurrentAuthInstanceContextInitState.localCacheExist);
        } else {
          stateSubject.add(CurrentAuthInstanceContextInitState
              .cantFetchAndLocalCacheNotExist);
        }
      }
    }
  }

  // ignore: close_sinks
  BehaviorSubject<CurrentAuthInstanceContextInitState> stateSubject =
      BehaviorSubject.seeded(CurrentAuthInstanceContextInitState.loading);

  @override
  CurrentAuthInstanceContextInitState get state => stateSubject.value;

  @override
  Stream<CurrentAuthInstanceContextInitState> get stateStream =>
      stateSubject.stream;

  @override
  Future internalAsyncInit() async {
    await refreshFromNetwork();
  }
}
