import 'package:easy_dispose/easy_dispose.dart';

import '../rest/mastodon_api_rest_service.dart';
import 'mastodon_api_service.dart';

abstract class MastodonApiService extends DisposableOwner
    implements IMastodonApiService {
  @override
  final IMastodonApiRestService restService;

  MastodonApiService({
    required this.restService,
  });
}
