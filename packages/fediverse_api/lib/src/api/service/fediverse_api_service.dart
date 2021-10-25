import 'package:easy_dispose/easy_dispose.dart';

import '../../../fediverse_api.dart';
import '../rest/fediverse_api_rest_service.dart';

abstract class IFediverseApiService implements IDisposable {
  IFediverseApiRestService get restService;
}
