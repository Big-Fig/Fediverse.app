import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IRemoteInstanceBloc
    implements IDisposable, IAsyncInitLoadingBloc {
  static IRemoteInstanceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IRemoteInstanceBloc>(context, listen: listen);

  Uri get instanceUri;

  IUnifediApiManager get unifediApiManager;

  IUnifediApiInstance? get unifediApiInstance;
}
