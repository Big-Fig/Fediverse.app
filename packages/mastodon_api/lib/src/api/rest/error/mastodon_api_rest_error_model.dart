import 'package:fediverse_api/fediverse_api_utils.dart';

import 'details/mastodon_api_rest_error_details_model.dart';

abstract class IMastodonApiRestError {
  IRestResponseError get restResponseError;

  IMastodonApiRestErrorDetails? get details;
}
