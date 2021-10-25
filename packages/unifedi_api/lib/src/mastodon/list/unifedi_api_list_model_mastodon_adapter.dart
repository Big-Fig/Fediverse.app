import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../api/list/unifedi_api_list_model.dart';
import 'replies_policy_type/unifedi_api_list_replies_policy_type_sealed_mastodon_converter.dart';

part 'unifedi_api_list_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_list_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiListMastodonAdapter
    with _$UnifediApiListMastodonAdapter
    implements IUnifediApiList {
  const UnifediApiListMastodonAdapter._();

  const factory UnifediApiListMastodonAdapter(
    @HiveField(0) MastodonApiList value,
  ) = _UnifediApiListMastodonAdapter;

  @override
  String get id => value.id;

  @override
  String get title => value.title;

  @override
  String? get repliesPolicy => value.repliesPolicyAsMastodonApi
      ?.toUnifediApiListRepliesPolicyType()
      .stringValue;

  factory UnifediApiListMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiListMastodonAdapterFromJson(json);
}

extension MastodonApiListUnifediExtension on IMastodonApiList {
  UnifediApiListMastodonAdapter toUnifediApiListMastodonAdapter() =>
      UnifediApiListMastodonAdapter(
        toMastodonApiList(),
      );
}

extension MastodonApiListUnifediListExtension on List<IMastodonApiList> {
  List<UnifediApiListMastodonAdapter> toUnifediApiListMastodonAdapterList() =>
      map(
        (item) => item.toUnifediApiListMastodonAdapter(),
      ).toList();
}
