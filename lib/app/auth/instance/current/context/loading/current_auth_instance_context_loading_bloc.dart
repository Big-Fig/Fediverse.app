import 'package:fedi/app/auth/instance/current/context/loading/current_auth_instance_context_loading_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICurrentAuthInstanceContextLoadingBloc
    implements IAsyncInitLoadingBloc, Disposable {
  static ICurrentAuthInstanceContextLoadingBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ICurrentAuthInstanceContextLoadingBloc>(context,
          listen: listen);

  CurrentAuthInstanceContextLoadingState get state;

  Stream<CurrentAuthInstanceContextLoadingState> get stateStream;

  Future refresh();
}
