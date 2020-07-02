import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/auth/instance/current/context/loading/current_auth_instance_context_loading_bloc.dart';
import 'package:fedi/app/auth/instance/current/context/loading/current_auth_instance_context_loading_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("current_auth_instance_context_loading_bloc_impl.dart");

class CurrentAuthInstanceContextLoadingBloc extends AsyncInitLoadingBloc
    implements ICurrentAuthInstanceContextLoadingBloc {
  final IMyAccountBloc myAccountBloc;
  final IPleromaInstanceService pleromaInstanceService;
  final ICurrentAuthInstanceBloc currentAuthInstanceBloc;

  CurrentAuthInstanceContextLoadingBloc({
    @required this.myAccountBloc,
    @required this.pleromaInstanceService,
    @required this.currentAuthInstanceBloc,
  }) {
    addDisposable(subject: stateSubject);
  }

  @override
  Future refresh() async {
    stateSubject.add(CurrentAuthInstanceContextLoadingState.loading);

    if (pleromaInstanceService.isApiReadyToUse) {
      var info = await pleromaInstanceService.getInstance();
      var currentInstance = currentAuthInstanceBloc.currentInstance;
      currentInstance = currentInstance.copyWith(info: info);
      await currentAuthInstanceBloc.changeCurrentInstance(currentInstance);
    }

    await myAccountBloc.refreshFromNetwork(false).then((_) {
      if (myAccountBloc.isLocalCacheExist) {
        stateSubject
            .add(CurrentAuthInstanceContextLoadingState.localCacheExist);
      } else {
        stateSubject.add(CurrentAuthInstanceContextLoadingState
            .cantFetchAndLocalCacheNotExist);
      }
    }).catchError((error, stackTrace) {
      _logger.warning(
          () => "can't myAccountBloc.refreshFromNetwork()", error, stackTrace);
      stateSubject.add(CurrentAuthInstanceContextLoadingState
          .cantFetchAndLocalCacheNotExist);
    });
  }

  // ignore: close_sinks
  BehaviorSubject<CurrentAuthInstanceContextLoadingState> stateSubject =
      BehaviorSubject.seeded(CurrentAuthInstanceContextLoadingState.loading);

  @override
  CurrentAuthInstanceContextLoadingState get state => stateSubject.value;

  @override
  Stream<CurrentAuthInstanceContextLoadingState> get stateStream =>
      stateSubject.stream;

  @override
  Future internalAsyncInit() async {
    await refresh();
  }
}
