import 'package:fediverse_api/fediverse_api.dart';

import '../mastodon_api_version_model.dart';

abstract class IMastodonApiVersionRange implements IFediverseApiVersionRange {
  @override
  IMastodonApiVersion? get min;

  @override
  IMastodonApiVersion? get max;
}
