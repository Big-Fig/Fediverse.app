import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:mastodon_api/mastodon_api.dart';

import 'details/pleroma_api_rest_error_details_model.dart';

abstract class IPleromaApiRestError {
  IRestResponseError get restResponseError;
  IMastodonApiRestErrorDetails? get mastodonDetails;
  IPleromaApiRestErrorDetails? get details;
}
