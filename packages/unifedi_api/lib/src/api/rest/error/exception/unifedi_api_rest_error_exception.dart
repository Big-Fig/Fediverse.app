import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:mastodon_api/mastodon_api.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../unifedi_api_rest_error_model.dart';

abstract class IUnifediApiRestErrorException
    implements
        IRestResponseErrorException,
        IMastodonApiRestErrorException,
        IPleromaApiRestErrorException {
  IUnifediApiRestError get unifediError;
}
