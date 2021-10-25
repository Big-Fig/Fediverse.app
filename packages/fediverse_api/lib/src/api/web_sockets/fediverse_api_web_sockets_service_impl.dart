import 'package:easy_dispose/easy_dispose.dart';

import '../../web_sockets/web_sockets_service.dart';
import '../access/fediverse_api_access_bloc.dart';
import '../access/fediverse_api_access_model.dart';
import 'fediverse_api_web_sockets_service.dart';

class FediverseApiWebSocketsService<T extends IFediverseApiAccess>
    extends DisposableOwner implements IFediverseApiWebSocketsService<T> {
  final IFediverseApiAccessBloc<T> accessBloc;
  @override
  final IWebSocketsService webSocketsService;

  FediverseApiWebSocketsService({
    required this.accessBloc,
    required this.webSocketsService,
  });

  static String calculateWebSocketsUrlScheme(IFediverseApiAccess access) {
    var urlScheme = access.urlScheme;

    String webSocketsScheme;

    switch (urlScheme) {
      case 'https':
        webSocketsScheme = 'wss';
        break;
      case 'http':
        webSocketsScheme = 'ws';
        break;
      default:
        throw ArgumentError(
          'Invalid urlScheme $urlScheme in ${access.url} for websockets',
        );
    }

    return webSocketsScheme;
  }
}
