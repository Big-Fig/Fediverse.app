import 'package:mastodon_api/mastodon_api.dart';

import '../../pleroma_api_model.dart';

abstract class IPleromaApiAccountRelationship
    implements IMastodonApiAccountRelationship, IPleromaApiResponse {
  bool? get subscribing;
}
