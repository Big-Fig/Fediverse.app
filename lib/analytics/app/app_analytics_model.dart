import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'app_analytics_model.freezed.dart';

part 'app_analytics_model.g.dart';

// ignore: no-magic-number
@HiveType(typeId: -32 + 94)
@freezed
class AppAnalyticsData with _$AppAnalyticsData implements IJsonObj {
  const factory AppAnalyticsData({
    @HiveField(0) required int appOpenedCount,
  }) = _AppAnalyticsData;

  factory AppAnalyticsData.fromJson(Map<String, dynamic> json) =>
      _$AppAnalyticsDataFromJson(json);
}
