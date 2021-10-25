import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../account/mastodon_api_account_model_impl.dart';
import '../status/mastodon_api_status_model_impl.dart';
import '../tag/mastodon_api_tag_model_impl.dart';
import 'mastodon_api_search_model.dart';

part 'mastodon_api_search_model_impl.freezed.dart';

part 'mastodon_api_search_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class MastodonApiSearchResult
    with _$MastodonApiSearchResult
    implements IMastodonApiSearchResult {
  const factory MastodonApiSearchResult({
    @HiveField(0) required List<MastodonApiAccount> accounts,
    @HiveField(1) required List<MastodonApiTag> hashtags,
    @HiveField(2) required List<MastodonApiStatus> statuses,
  }) = _MastodonApiSearchResult;

  factory MastodonApiSearchResult.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiSearchResultFromJson(json);
}

extension IMastodonApiSearchResultInterfaceExtension
    on IMastodonApiSearchResult {
  MastodonApiSearchResult toMastodonApiSearchResult({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiSearchResult(
          accounts: accounts.toMastodonApiAccountList(
            forceNewObject: forceNewObject,
          ),
          hashtags: hashtags.toMastodonApiTagList(
            forceNewObject: forceNewObject,
          ),
          statuses: statuses.toMastodonApiStatusList(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
