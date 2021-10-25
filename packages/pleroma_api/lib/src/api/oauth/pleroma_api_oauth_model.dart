import 'package:mastodon_api/mastodon_api.dart';

import '../pleroma_api_model.dart';

abstract class IPleromaApiOAuthToken
    implements IMastodonApiOAuthToken, IPleromaApiResponse {
  String? get id;
  String? get me;
}
