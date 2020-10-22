import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/auth/instance/current/context/init/current_auth_instance_context_init_bloc.dart';
import 'package:fedi/app/auth/instance/current/context/init/current_auth_instance_context_init_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("current_auth_instance_context_init_bloc_impl.dart");

class CurrentAuthInstanceContextInitBloc extends AsyncInitLoadingBloc
    implements ICurrentAuthInstanceContextInitBloc {
  final IMyAccountBloc myAccountBloc;
  final IPleromaInstanceService pleromaInstanceService;
  final ICurrentAuthInstanceBloc currentAuthInstanceBloc;

  CurrentAuthInstanceContextInitBloc({
    @required this.myAccountBloc,
    @required this.pleromaInstanceService,
    @required this.currentAuthInstanceBloc,
  }) {
    addDisposable(subject: stateSubject);
  }

  @override
  Future refresh() async {
    stateSubject.add(CurrentAuthInstanceContextInitState.loading);
    var isApiReadyToUse = pleromaInstanceService.isApiReadyToUse;
    _logger.finest(() => "refresh isApiReadyToUse $isApiReadyToUse");

    if (isApiReadyToUse) {
      try {
        var info = await pleromaInstanceService.getInstance();
        var currentInstance = currentAuthInstanceBloc.currentInstance;
        currentInstance = currentInstance.copyWith(info: info);
        await currentAuthInstanceBloc.changeCurrentInstance(currentInstance);
      } catch (e, stackTrace) {
        _logger.warning(() => "failed to update instance info", e, stackTrace);
      }
    }

    await myAccountBloc
        .refreshFromNetwork(isNeedPreFetchRelationship: false)
        .then((_) {
      if (myAccountBloc.isLocalCacheExist) {
        stateSubject.add(CurrentAuthInstanceContextInitState.localCacheExist);
      } else {
        stateSubject.add(
            CurrentAuthInstanceContextInitState.cantFetchAndLocalCacheNotExist);
      }
    }).catchError((error, stackTrace) {
      _logger.warning(
          () => "can't myAccountBloc.refreshFromNetwork()", error, stackTrace);
      if (myAccountBloc.isLocalCacheExist) {
        stateSubject.add(CurrentAuthInstanceContextInitState.localCacheExist);
      } else {
        stateSubject.add(
            CurrentAuthInstanceContextInitState.cantFetchAndLocalCacheNotExist);
      }
    });
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
    await refresh();
  }
}
