import 'package:fedi/mastodon/api/status/mastodon_api_status_model.dart';

abstract class IMastodonApiStatusContext {
  List<IMastodonApiStatus>? get descendants;

  List<IMastodonApiStatus>? get ancestors;
}
