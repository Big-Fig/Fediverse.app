import 'package:fedi/refactored/enum/enum_values.dart';
import 'package:fedi/refactored/mastodon/account/mastodon_account_model.dart';
import 'package:fedi/refactored/mastodon/status/mastodon_status_model.dart';
import 'package:fedi/refactored/mastodon/tag/mastodon_tag_model.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class IMastodonSearchRequest {
  String get query;

  String get accountId;

  String get maxId;

  String get minId;

  MastodonSearchRequestType get type;

  bool get excludeUnreviewed;

  int get limit;

  int get offset;

  bool get following;

  bool get resolve;
}

enum MastodonSearchRequestType { accounts, hashtags, statuses }

final mastodonSearchRequestTypeTypeValues = EnumValues({
  "accounts": MastodonSearchRequestType.accounts,
  "hashtags": MastodonSearchRequestType.hashtags,
  "statuses": MastodonSearchRequestType.statuses,
});

class MastodonSearchRequestTypeConverter
    implements JsonConverter<MastodonSearchRequestType, String> {
  const MastodonSearchRequestTypeConverter();

  @override
  MastodonSearchRequestType fromJson(String value) =>
      mastodonSearchRequestTypeTypeValues.map[value];

  @override
  String toJson(MastodonSearchRequestType value) =>
      mastodonSearchRequestTypeTypeValues.reverse[value];
}

abstract class IMastodonSearchResult {
  List<IMastodonAccount> get accounts;

  List<IMastodonStatus> get statuses;

  List<IMastodonTag> get hashtags;
}
