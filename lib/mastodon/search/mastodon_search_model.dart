import 'package:fedi/mastodon/account/mastodon_account_model.dart';
import 'package:fedi/mastodon/status/mastodon_status_model.dart';
import 'package:fedi/mastodon/tag/mastodon_tag_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moor/moor.dart' as moor;

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

enum MastodonSearchRequestType {
  accounts,
  hashtags,
  statuses,
}

abstract class IMastodonSearchResult {
  List<IMastodonAccount> get accounts;

  List<IMastodonStatus> get statuses;

  List<IMastodonTag> get hashtags;
}

const _accountsMastodonSearchRequestTypeJsonValue = "accounts";
const _hashtagsMastodonSearchRequestTypeJsonValue = "hashtags";
const _statusesMastodonSearchRequestTypeJsonValue = "statuses";

extension MastodonSearchRequestTypeListExtension on List<MastodonSearchRequestType> {
  List<String> toMastodonSearchRequestTypeStrings() => map(
        (visibility) => visibility.toJsonValue(),
  ).toList();
}

extension MastodonSearchRequestTypeExtension on MastodonSearchRequestType {
  String toJsonValue() {
    String result;

    switch (this) {
      case MastodonSearchRequestType.accounts:
        result = _accountsMastodonSearchRequestTypeJsonValue;
        break;
      case MastodonSearchRequestType.statuses:
        result = _statusesMastodonSearchRequestTypeJsonValue;
        break;
      case MastodonSearchRequestType.hashtags:
        result = _hashtagsMastodonSearchRequestTypeJsonValue;
        break;
    }

    return result;
  }
}

extension MastodonSearchRequestTypeStringExtension on String {
  MastodonSearchRequestType toMastodonSearchRequestType() {
    MastodonSearchRequestType result;

    switch (this) {
      case _statusesMastodonSearchRequestTypeJsonValue:
        result = MastodonSearchRequestType.statuses;
        break;
      case _accountsMastodonSearchRequestTypeJsonValue:
        result = MastodonSearchRequestType.accounts;
        break;
      case _hashtagsMastodonSearchRequestTypeJsonValue:
        result = MastodonSearchRequestType.hashtags;
        break;
      default:
        throw "Invalid MastodonSearchRequestType $this";
    }

    return result;
  }
}

class MastodonSearchRequestTypeTypeConverter
    implements
        JsonConverter<MastodonSearchRequestType, String?>,
        moor.TypeConverter<MastodonSearchRequestType, String?> {
  const MastodonSearchRequestTypeTypeConverter();

  @override
  MastodonSearchRequestType fromJson(String? value) =>
      value!.toMastodonSearchRequestType();

  @override
  String? toJson(MastodonSearchRequestType? value) => value?.toJsonValue();

  @override
  MastodonSearchRequestType? mapToDart(String? fromDb) => fromJson(fromDb);

  @override
  String? mapToSql(MastodonSearchRequestType? value) => toJson(value);
}

