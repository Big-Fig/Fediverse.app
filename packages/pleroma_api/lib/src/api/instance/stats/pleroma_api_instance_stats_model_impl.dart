import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_instance_stats_model.dart';

// ignore_for_file: no-magic-number

part 'pleroma_api_instance_stats_model_impl.freezed.dart';

part 'pleroma_api_instance_stats_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiInstanceStats
    with _$PleromaApiInstanceStats
    implements IPleromaApiInstanceStats {
  const factory PleromaApiInstanceStats({
    @JsonKey(name: 'user_count') @HiveField(0) required int? userCount,
    @JsonKey(name: 'status_count') @HiveField(1) required int? statusCount,
    @JsonKey(name: 'domain_count') @HiveField(2) required int? domainCount,
  }) = _PleromaApiInstanceStats;

  factory PleromaApiInstanceStats.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiInstanceStatsFromJson(json);
}

extension PleromaApiInstanceStatsInterfaceExtension
    on IPleromaApiInstanceStats {
  PleromaApiInstanceStats toPleromaApiInstanceStats({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiInstanceStats(
          userCount: userCount,
          statusCount: statusCount,
          domainCount: domainCount,
        ),
        forceNewObject: forceNewObject,
      );
}
