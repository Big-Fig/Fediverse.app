import '../mastodon_api_model.dart';

abstract class IMastodonApiField implements IMastodonApiResponsePart {
  String? get name;

  String? get value;

  DateTime? get verifiedAt;
}
