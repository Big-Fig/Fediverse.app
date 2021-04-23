import 'dart:convert';

import 'package:fedi/mastodon/api/search/mastodon_api_search_model.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/tag/pleroma_api_tag_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_search_model.g.dart';

abstract class IPleromaApiSearchRequest extends IMastodonApiSearchRequest {
  Map<String, dynamic> toJson();
}

abstract class IPleromaApiSearchResult extends IMastodonSearchResult {
  @override
  List<IPleromaApiAccount> get accounts;

  @override
  List<IPleromaApiStatus> get statuses;

  @override
  List<IPleromaApiTag> get hashtags;
}

@JsonSerializable(explicitToJson: true)
class PleromaApiSearchResult extends IPleromaApiSearchResult {
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
          accounts == other.accounts &&
          hashtags == other.hashtags &&
          statuses == other.statuses;

  @override
  int get hashCode => accounts.hashCode ^ hashtags.hashCode ^ statuses.hashCode;

  @override
  String toString() {
    return 'PleromaApiSearchResult{'
        'accounts: $accounts, '
        'hashtags: $hashtags, '
        'statuses: $statuses'
        '}';
  }

  factory PleromaApiSearchResult.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiSearchResultFromJson(json);

  factory PleromaApiSearchResult.fromJsonString(String jsonString) =>
      _$PleromaApiSearchResultFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaApiSearchResultToJson(this);

  String toJsonString() => jsonEncode(_$PleromaApiSearchResultToJson(this));
}
