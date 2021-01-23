import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IRemoteInstanceBloc implements IDisposable {
  static IRemoteInstanceBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IRemoteInstanceBloc>(context, listen: listen);

  Uri get instanceUri;

  IPleromaRestService get pleromaRestService;
}
