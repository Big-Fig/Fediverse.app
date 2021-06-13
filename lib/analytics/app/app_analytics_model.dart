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

  const AppAnalyticsData({
    required this.appOpenedCount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppAnalyticsData &&
          runtimeType == other.runtimeType &&
          appOpenedCount == other.appOpenedCount;

  @override
  int get hashCode => appOpenedCount.hashCode;

  @override
  String toString() {
    return 'AppAnalyticsData{'
        'appOpenedCount: $appOpenedCount, '
        '}';
  }

  AppAnalyticsData copyWith({
    int? appOpenedCount,
    bool? isAppRated,
    bool? isHandlingCrashlyticsAsked,
  }) =>
      AppAnalyticsData(
        appOpenedCount: appOpenedCount ?? this.appOpenedCount,
      );

  static AppAnalyticsData fromJson(Map<String, dynamic> json) =>
      _$AppAnalyticsDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AppAnalyticsDataToJson(this);
}
