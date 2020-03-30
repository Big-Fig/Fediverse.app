
import 'package:fedi/refactored/app/auth/instance/current/context/loading/current_instance_context_loading_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICurrentInstanceContextLoadingBloc extends Disposable {

  static ICurrentInstanceContextLoadingBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ICurrentInstanceContextLoadingBloc>(context, listen: listen);


  CurrentInstanceContextLoadingState get state;

  Stream<CurrentInstanceContextLoadingState> get stateStream;

  refresh();
}
