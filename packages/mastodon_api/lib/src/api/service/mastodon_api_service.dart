import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api.dart';

import '../rest/mastodon_api_rest_service.dart';

abstract class IMastodonApiService
    implements IFediverseApiService, IDisposable {
  @override
  IMastodonApiRestService get restService;
}
