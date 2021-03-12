import 'package:fedi/app/auth/instance/current/context/init/current_auth_instance_context_init_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICurrentAuthInstanceContextInitBloc
    implements IAsyncInitLoadingBloc, IDisposable {
  static ICurrentAuthInstanceContextInitBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ICurrentAuthInstanceContextInitBloc>(context, listen: listen);

  CurrentAuthInstanceContextInitState get state;

  Stream<CurrentAuthInstanceContextInitState> get stateStream;

  Future refreshFromNetwork({@required bool isNeedWaitForOptionalData});
}
