import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_instance_stats_model.dart';

// ignore_for_file: no-magic-number

part 'unifedi_api_instance_stats_model_impl.freezed.dart';

part 'unifedi_api_instance_stats_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiInstanceStats
    with _$UnifediApiInstanceStats
    implements IUnifediApiInstanceStats {
  const factory UnifediApiInstanceStats({
    @JsonKey(name: 'user_count') @HiveField(0) required int? userCount,
    @JsonKey(name: 'status_count') @HiveField(1) required int? statusCount,
    @JsonKey(name: 'domain_count') @HiveField(2) required int? domainCount,
  }) = _UnifediApiInstanceStats;

  factory UnifediApiInstanceStats.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstanceStatsFromJson(json);
}

extension UnifediApiInstanceStatsInterfaceExtension
    on IUnifediApiInstanceStats {
  UnifediApiInstanceStats toUnifediApiInstanceStats({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiInstanceStats(
          userCount: userCount,
          statusCount: statusCount,
          domainCount: domainCount,
        ),
        forceNewObject: forceNewObject,
      );
}
