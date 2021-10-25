import '../../mastodon_api_model.dart';

abstract class IMastodonApiInstanceStats implements IMastodonApiResponsePart {
  int? get userCount;

  int? get statusCount;

  int? get domainCount;
}
