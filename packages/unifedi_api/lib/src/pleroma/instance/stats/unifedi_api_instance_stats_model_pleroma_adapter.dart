import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/instance/stats/unifedi_api_instance_stats_model.dart';

part 'unifedi_api_instance_stats_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_instance_stats_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiInstanceStatsPleromaAdapter
    with _$UnifediApiInstanceStatsPleromaAdapter
    implements IUnifediApiInstanceStats {
  const UnifediApiInstanceStatsPleromaAdapter._();

  const factory UnifediApiInstanceStatsPleromaAdapter(
    @HiveField(0) PleromaApiInstanceStats value,
  ) = _UnifediApiInstanceStatsPleromaAdapter;

  @override
  int? get domainCount => value.domainCount;

  @override
  int? get statusCount => value.statusCount;

  @override
  int? get userCount => value.userCount;

  factory UnifediApiInstanceStatsPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstanceStatsPleromaAdapterFromJson(json);
}

extension PleromaApiFeatureUnifediExtension on IPleromaApiInstanceStats {
  UnifediApiInstanceStatsPleromaAdapter
      toUnifediApiInstanceStatsPleromaAdapter() =>
          UnifediApiInstanceStatsPleromaAdapter(
            toPleromaApiInstanceStats(),
          );
}

extension UnifediApiInstanceStatsPleromaExtension on IUnifediApiInstanceStats {
  PleromaApiInstanceStats toPleromaApiInstanceStats() =>
      PleromaApiInstanceStats(
        userCount: userCount,
        statusCount: statusCount,
        domainCount: domainCount,
      );
}
