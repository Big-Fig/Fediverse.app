import 'package:fedi_app/app/context/app_context_bloc.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInitBloc extends IAsyncInitLoadingBloc {
  static IInitBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IInitBloc>(context, listen: listen);

  IAppContextBloc get appContextBloc;
}
