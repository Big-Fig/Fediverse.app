import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/version/range/unifedi_api_version_range_model.dart';
import '../../../api/version/unifedi_api_version_model.dart';
import '../unifedi_api_version_model_mastodon_adapter.dart';

part 'unifedi_api_version_range_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_version_range_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiVersionRangeMastodonAdapter
    with _$UnifediApiVersionRangeMastodonAdapter
    implements IUnifediApiVersionRange {
  const UnifediApiVersionRangeMastodonAdapter._();
  const factory UnifediApiVersionRangeMastodonAdapter(
    @HiveField(0) MastodonApiVersionRange value,
  ) = _UnifediApiVersionRangeMastodonAdapter;

  @override
  IUnifediApiVersion? get max =>
      value.max?.toUnifediApiVersionMastodonAdapter();

  @override
  bool get maxInclusive => value.maxInclusive;

  @override
  IUnifediApiVersion? get min =>
      value.min?.toUnifediApiVersionMastodonAdapter();

  @override
  bool get minInclusive => value.minInclusive;
  factory UnifediApiVersionRangeMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiVersionRangeMastodonAdapterFromJson(json);
}

extension MastodonApiFeatureUnifediExtension on IMastodonApiVersionRange {
  UnifediApiVersionRangeMastodonAdapter
      toUnifediApiVersionRangeMastodonAdapter() =>
          UnifediApiVersionRangeMastodonAdapter(
            toMastodonApiVersionRange(),
          );
}
