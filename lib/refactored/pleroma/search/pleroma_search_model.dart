import 'dart:convert';

import 'package:fedi/refactored/mastodon/search/mastodon_search_model.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/refactored/pleroma/tag/pleroma_tag_model.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_search_model.g.dart';

abstract class IPleromaSearchRequest extends IMastodonSearchRequest {
  Map<String, dynamic> toJson();
}

@JsonSerializable()
@MastodonSearchRequestTypeConverter()
class PleromaSearchRequest extends IPleromaSearchRequest {
  @override
  @JsonKey(name: "accountId")
  String accountId;

  @override
  @JsonKey(name: "exclude_unreviewed")
  bool excludeUnreviewed;

  @override
  bool following;

  @override
  int limit;

  @override
  @JsonKey(name: "max_id")
  String maxId;

  @JsonKey(name: "min_id")
  @override
  String minId;

  @override
  int offset;

  @override
  @JsonKey(name: "q")
  String query;

  @override
  bool resolve;

  @override
  MastodonSearchRequestType type;
  PleromaSearchRequest(
      {this.accountId,
      this.excludeUnreviewed,
      this.following,
      this.limit,
      this.maxId,
      this.minId,
      this.offset,
      @required this.query,
      this.resolve,
      this.type});

  @override
  String toString() {
    return 'PleromaSearchRequest{accountId: $accountId,'
        ' excludeUnreviewed: $excludeUnreviewed, following: $following,'
        ' limit: $limit, maxId: $maxId, minId: $minId, offset: $offset,'
        ' query: $query, resolve: $resolve, type: $type}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaSearchRequest &&
          runtimeType == other.runtimeType &&
          accountId == other.accountId &&
          excludeUnreviewed == other.excludeUnreviewed &&
          following == other.following &&
          limit == other.limit &&
          maxId == other.maxId &&
          minId == other.minId &&
          offset == other.offset &&
          query == other.query &&
          resolve == other.resolve &&
          type == other.type;
  @override
  int get hashCode =>
      accountId.hashCode ^
      excludeUnreviewed.hashCode ^
      following.hashCode ^
      limit.hashCode ^
      maxId.hashCode ^
      minId.hashCode ^
      offset.hashCode ^
      query.hashCode ^
      resolve.hashCode ^
      type.hashCode;

  factory PleromaSearchRequest.fromJson(Map<String, dynamic> json) =>
      _$PleromaSearchRequestFromJson(json);

  factory PleromaSearchRequest.fromJsonString(String jsonString) =>
      _$PleromaSearchRequestFromJson(jsonDecode(jsonString));

  @override
  Map<String, dynamic> toJson() => _$PleromaSearchRequestToJson(this);

  String toJsonString() => jsonEncode(_$PleromaSearchRequestToJson(this));
}

abstract class IPleromaSearchResult extends IMastodonSearchResult {
  @override
  List<IPleromaAccount> get accounts;

  @override
  List<IPleromaStatus> get statuses;

  @override
  List<IPleromaTag> get hashtags;
}

@JsonSerializable(explicitToJson: true)
class PleromaSearchResult extends IPleromaSearchResult {
  @override
  List<PleromaAccount> accounts;

  @override
  List<PleromaTag> hashtags;

  @override
  List<PleromaStatus> statuses;
  PleromaSearchResult({this.accounts, this.hashtags, this.statuses});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaSearchResult &&
          runtimeType == other.runtimeType &&
          accounts == other.accounts &&
          hashtags == other.hashtags &&
          statuses == other.statuses;
  @override
  int get hashCode => accounts.hashCode ^ hashtags.hashCode ^ statuses.hashCode;
  @override
  String toString() {
    return 'PleromaSearchResult{accounts: $accounts,'
        ' hashtags: $hashtags, statuses: $statuses}';
  }

  factory PleromaSearchResult.fromJson(Map<String, dynamic> json) =>
      _$PleromaSearchResultFromJson(json);

  factory PleromaSearchResult.fromJsonString(String jsonString) =>
      _$PleromaSearchResultFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaSearchResultToJson(this);

  String toJsonString() => jsonEncode(_$PleromaSearchResultToJson(this));
}
