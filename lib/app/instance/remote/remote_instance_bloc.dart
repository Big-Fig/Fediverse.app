import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IRemoteInstanceBloc implements IDisposable {
  static IRemoteInstanceBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IRemoteInstanceBloc>(context, listen: listen);

  Uri get instanceUri;

  IPleromaApiRestService get pleromaRestService;
}
