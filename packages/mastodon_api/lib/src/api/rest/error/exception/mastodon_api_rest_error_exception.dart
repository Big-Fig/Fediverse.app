import 'package:fediverse_api/fediverse_api_utils.dart';

import '../mastodon_api_rest_error_model.dart';

abstract class IMastodonApiRestErrorException
    implements IRestResponseErrorException {
  IMastodonApiRestError get mastodonError;
}
