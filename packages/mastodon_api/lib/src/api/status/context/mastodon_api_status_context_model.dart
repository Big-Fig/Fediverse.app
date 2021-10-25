import '../../mastodon_api_model.dart';
import '../mastodon_api_status_model.dart';

abstract class IMastodonApiStatusContext implements IMastodonApiResponse {
  List<IMastodonApiStatus> get descendants;

  List<IMastodonApiStatus> get ancestors;
}
