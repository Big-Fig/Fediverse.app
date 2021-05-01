import 'package:fedi/collection/collection_hash_utils.dart';
import 'package:fedi/json/json_model.dart';
import 'package:fedi/mastodon/api/search/mastodon_api_search_model.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/tag/pleroma_api_tag_model.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_search_model.g.dart';

abstract class IPleromaApiSearchRequest extends IMastodonApiSearchRequest {
  Map<String, dynamic> toJson();
}

abstract class IPleromaApiSearchResult extends IMastodonApiSearchResult {
  @override
  List<IPleromaApiAccount> get accounts;

  @override
  List<IPleromaApiStatus> get statuses;

  @override
  List<IPleromaApiTag> get hashtags;
}

@JsonSerializable(explicitToJson: true)
class PleromaApiSearchResult extends IPleromaApiSearchResult
    implements IJsonObject {
  @override
  final List<PleromaApiAccount> accounts;

  @override
  final List<PleromaApiTag> hashtags;

  @override
  final List<PleromaApiStatus> statuses;

  PleromaApiSearchResult({
    required this.accounts,
    required this.hashtags,
    required this.statuses,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiSearchResult &&
          runtimeType == other.runtimeType &&
          listEquals(accounts, other.accounts) &&
          listEquals(hashtags, other.hashtags) &&
          listEquals(statuses, other.statuses);

  @override
  int get hashCode =>
      listHash(accounts) ^ listHash(hashtags) ^ listHash(statuses);

  @override
  String toString() {
    return 'PleromaApiSearchResult{'
        'accounts: $accounts, '
        'hashtags: $hashtags, '
        'statuses: $statuses'
        '}';
  }

  static PleromaApiSearchResult fromJson(Map<String, dynamic> json) =>
      _$PleromaApiSearchResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiSearchResultToJson(this);
}
