import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_service.dart';
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
