import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';
import '../../../api/instance/stats/unifedi_api_instance_stats_model.dart';

part 'unifedi_api_instance_stats_model_mastodon_adapter.freezed.dart';
part 'unifedi_api_instance_stats_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiInstanceStatsMastodonAdapter
    with _$UnifediApiInstanceStatsMastodonAdapter
    implements IUnifediApiInstanceStats {
  const UnifediApiInstanceStatsMastodonAdapter._();
  const factory UnifediApiInstanceStatsMastodonAdapter(
    @HiveField(0) MastodonApiInstanceStats value,
  ) = _UnifediApiInstanceStatsMastodonAdapter;

  @override
  int? get domainCount => value.domainCount;

  @override
  int? get statusCount => value.statusCount;

  @override
  int? get userCount => value.userCount;
  factory UnifediApiInstanceStatsMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstanceStatsMastodonAdapterFromJson(json);
}

extension MastodonApiFeatureUnifediExtension on IMastodonApiInstanceStats {
  UnifediApiInstanceStatsMastodonAdapter
      toUnifediApiInstanceStatsMastodonAdapter() =>
          UnifediApiInstanceStatsMastodonAdapter(
            toMastodonApiInstanceStats(),
          );
}

extension UnifediApiInstanceStatsMastodonExtension on IUnifediApiInstanceStats {
  MastodonApiInstanceStats toMastodonApiInstanceStats() =>
      MastodonApiInstanceStats(
        userCount: userCount,
        statusCount: statusCount,
        domainCount: domainCount,
      );
}
