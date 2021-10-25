import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api.dart';

import '../rest/pleroma_api_rest_service.dart';

abstract class IPleromaApiService implements IFediverseApiService, IDisposable {
  @override
  IPleromaApiRestService get restService;
}
