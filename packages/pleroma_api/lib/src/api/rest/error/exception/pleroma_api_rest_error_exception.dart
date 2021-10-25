import 'package:mastodon_api/mastodon_api.dart';

import '../pleroma_api_rest_error_model.dart';

abstract class IPleromaApiRestErrorException
    implements IMastodonApiRestErrorException {
  IPleromaApiRestError get pleromaError;
}
