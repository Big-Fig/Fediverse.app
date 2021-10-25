import 'package:easy_dispose/easy_dispose.dart';

import '../../../fediverse_api.dart';
import '../../web_sockets/web_sockets_service.dart';
import '../access/fediverse_api_access_model.dart';

abstract class IFediverseApiWebSocketsService<T extends IFediverseApiAccess>
    implements IDisposable {
  IWebSocketsService get webSocketsService;
}
