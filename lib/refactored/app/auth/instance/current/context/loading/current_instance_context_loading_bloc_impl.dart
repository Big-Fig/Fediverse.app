import 'package:fedi/refactored/app/account/my/my_account_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/current/context/loading/current_instance_context_loading_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/current/context/loading/current_instance_context_loading_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class CurrentInstanceContextLoadingBloc extends DisposableOwner
    implements ICurrentInstanceContextLoadingBloc {
  final IMyAccountBloc myAccountBloc;

  CurrentInstanceContextLoadingBloc({@required this.myAccountBloc}) {
    refresh();
    addDisposable(subject: stateSubject);
  }

  void refresh() {
    stateSubject.add(
        CurrentInstanceContextLoadingState.loading);
    myAccountBloc.requestRefreshFromNetwork().then((_) {
      if (myAccountBloc.isLocalCacheExist) {
        stateSubject.add(CurrentInstanceContextLoadingState.localCacheExist);
      } else {
        stateSubject.add(
            CurrentInstanceContextLoadingState.cantFetchAndLocalCacheNotExist);
      }
    });
  }

  // ignore: close_sinks
  BehaviorSubject<CurrentInstanceContextLoadingState> stateSubject =
      BehaviorSubject.seeded(CurrentInstanceContextLoadingState.loading);

  @override
  CurrentInstanceContextLoadingState get state => stateSubject.value;

  @override
  Stream<CurrentInstanceContextLoadingState> get stateStream =>
      stateSubject.stream;
}
