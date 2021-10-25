import '../../mastodon_api_model.dart';

abstract class IMastodonApiInstanceUrls implements IMastodonApiResponsePart {
  String? get streamingApi;
}
