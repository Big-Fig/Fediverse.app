import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IRemoteInstanceBloc
    implements IDisposable, IAsyncInitLoadingBloc {
  static IRemoteInstanceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IRemoteInstanceBloc>(context, listen: listen);

  Uri get instanceUri;

  IPleromaApiRestService get pleromaRestService;

  IPleromaApiInstance? get pleromaApiInstance;
}
