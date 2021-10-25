import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';
import '../../api/account/unifedi_api_account_model.dart';
import '../../api/search/unifedi_api_search_model.dart';
import '../../api/status/unifedi_api_status_model.dart';
import '../../api/tag/unifedi_api_tag_model.dart';
import '../account/unifedi_api_account_model_mastodon_adapter.dart';
import '../status/unifedi_api_status_model_mastodon_adapter.dart';
import '../tag/unifedi_api_tag_model_mastodon_adapter.dart';

part 'unifedi_api_search_model_mastodon_adapter.freezed.dart';
part 'unifedi_api_search_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiSearchResultMastodonAdapter
    with _$UnifediApiSearchResultMastodonAdapter
    implements IUnifediApiSearchResult {
  const UnifediApiSearchResultMastodonAdapter._();
  const factory UnifediApiSearchResultMastodonAdapter(
    @HiveField(0) MastodonApiSearchResult value,
  ) = _UnifediApiSearchResultMastodonAdapter;

  @override
  List<IUnifediApiAccount> get accounts =>
      value.accounts.toUnifediApiAccountMastodonAdapterList();

  @override
  List<IUnifediApiTag> get hashtags =>
      value.hashtags.toUnifediApiTagMastodonAdapterList();

  @override
  List<IUnifediApiStatus> get statuses =>
      value.statuses.toUnifediApiStatusMastodonAdapterList();
  factory UnifediApiSearchResultMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiSearchResultMastodonAdapterFromJson(json);
}

extension MastodonApiSearchResultUnifediExtension on IMastodonApiSearchResult {
  UnifediApiSearchResultMastodonAdapter
      toUnifediApiSearchResultMastodonAdapter() =>
          UnifediApiSearchResultMastodonAdapter(
            toMastodonApiSearchResult(),
          );
}

extension MastodonApiSearchResultUnifediListExtension
    on List<IMastodonApiSearchResult> {
  List<UnifediApiSearchResultMastodonAdapter>
      toUnifediApiSearchResultMastodonAdapterList() => map(
            (item) => item.toUnifediApiSearchResultMastodonAdapter(),
          ).toList();
}
