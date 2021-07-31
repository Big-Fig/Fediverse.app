import 'package:mastodon_fediverse_api/src/mastodon/api/account/mastodon_api_account_model.dart';
import 'package:mastodon_fediverse_api/src/mastodon/api/status/mastodon_api_status_model.dart';
import 'package:mastodon_fediverse_api/src/mastodon/api/tag/mastodon_api_tag_model.dart';

abstract class IMastodonApiSearchRequest {
  String get query;

  String get accountId;

  String get maxId;

  String get minId;

  String get type;

  MastodonApiSearchRequestType get typeAsMastodonApi;

  bool get excludeUnreviewed;

  int get limit;

  int get offset;

  bool get following;

  bool get resolve;
}

enum MastodonApiSearchRequestType {
  accounts,
  hashtags,
  statuses,
}

abstract class IMastodonApiSearchResult {
  List<IMastodonApiAccount> get accounts;

  List<IMastodonApiStatus> get statuses;

  List<IMastodonApiTag> get hashtags;
}

const _accountsMastodonSearchRequestTypeJsonValue = 'accounts';
const _hashtagsMastodonSearchRequestTypeJsonValue = 'hashtags';
const _statusesMastodonSearchRequestTypeJsonValue = 'statuses';

extension MastodonApiSearchRequestTypeExtension
    on MastodonApiSearchRequestType {
  String toJsonValue() {
    String result;

    switch (this) {
      case MastodonApiSearchRequestType.accounts:
        result = _accountsMastodonSearchRequestTypeJsonValue;
        break;
      case MastodonApiSearchRequestType.statuses:
        result = _statusesMastodonSearchRequestTypeJsonValue;
        break;
      case MastodonApiSearchRequestType.hashtags:
        result = _hashtagsMastodonSearchRequestTypeJsonValue;
        break;
    }

    return result;
  }
}

extension MastodonApiSearchRequestTypeStringExtension on String {
  MastodonApiSearchRequestType toMastodonApiSearchRequestType() {
    MastodonApiSearchRequestType result;

    switch (this) {
      case _statusesMastodonSearchRequestTypeJsonValue:
        result = MastodonApiSearchRequestType.statuses;
        break;
      case _accountsMastodonSearchRequestTypeJsonValue:
        result = MastodonApiSearchRequestType.accounts;
        break;
      case _hashtagsMastodonSearchRequestTypeJsonValue:
        result = MastodonApiSearchRequestType.hashtags;
        break;
      default:
        throw 'Invalid MastodonSearchRequestType $this';
    }

    return result;
  }
}
