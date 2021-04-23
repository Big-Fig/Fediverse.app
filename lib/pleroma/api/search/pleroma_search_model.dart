import 'dart:convert';

import 'package:fedi/mastodon/api/search/mastodon_search_model.dart';
import 'package:fedi/pleroma/api/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/api/tag/pleroma_tag_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_search_model.g.dart';

abstract class IPleromaSearchRequest extends IMastodonSearchRequest {
  Map<String, dynamic> toJson();
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

  PleromaSearchResult({
    required this.accounts,
    required this.hashtags,
    required this.statuses,
  });

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
    return 'PleromaSearchResult{'
        'accounts: $accounts, '
        'hashtags: $hashtags, '
        'statuses: $statuses'
        '}';
  }

  factory PleromaSearchResult.fromJson(Map<String, dynamic> json) =>
      _$PleromaSearchResultFromJson(json);

  factory PleromaSearchResult.fromJsonString(String jsonString) =>
      _$PleromaSearchResultFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaSearchResultToJson(this);

  String toJsonString() => jsonEncode(_$PleromaSearchResultToJson(this));
}
