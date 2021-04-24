import 'package:fedi/json/json_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_analytics_model.g.dart';

@JsonSerializable()
// ignore: no-magic-number
@HiveType(typeId: -32 + 94)
class AppAnalyticsData implements IJsonObject {
  @HiveField(0)
  final int appOpenedCount;
  @HiveField(1)
  final bool isAppRated;

  const AppAnalyticsData({
    required this.appOpenedCount,
    required this.isAppRated,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppAnalyticsData &&
          runtimeType == other.runtimeType &&
          appOpenedCount == other.appOpenedCount &&
          isAppRated == other.isAppRated;

  @override
  int get hashCode => appOpenedCount.hashCode ^ isAppRated.hashCode;

  @override
  String toString() {
    return 'AppAnalyticsData{'
        'appOpenedCount: $appOpenedCount, '
        'isAppRated: $isAppRated'
        '}';
  }

  AppAnalyticsData copyWith({
    int? appOpenedCount,
    bool? isAppRated,
  }) =>
      AppAnalyticsData(
        appOpenedCount: appOpenedCount ?? this.appOpenedCount,
        isAppRated: isAppRated ?? this.isAppRated,
      );

  static AppAnalyticsData fromJson(Map<String, dynamic> json) =>
      _$AppAnalyticsDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AppAnalyticsDataToJson(this);
}
