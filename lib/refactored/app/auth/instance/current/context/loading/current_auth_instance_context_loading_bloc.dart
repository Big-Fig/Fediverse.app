
import 'package:fedi/refactored/app/auth/instance/current/context/loading/current_auth_instance_context_loading_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICurrentAuthInstanceContextLoadingBloc extends Disposable {

  static ICurrentAuthInstanceContextLoadingBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ICurrentAuthInstanceContextLoadingBloc>(context, listen: listen);


  CurrentAuthInstanceContextLoadingState get state;

  Stream<CurrentAuthInstanceContextLoadingState> get stateStream;

  refresh();
}
