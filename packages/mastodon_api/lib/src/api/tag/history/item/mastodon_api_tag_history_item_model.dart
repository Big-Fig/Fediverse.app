import '../../../mastodon_api_model.dart';

abstract class IMastodonApiTagHistoryItem implements IMastodonApiResponsePart {
  int get dayInUnixTimestamp;

  int get uses;

  int get accounts;
}
