import 'dart:convert';

import 'package:fedi/json/json_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_analytics_model.g.dart';

@JsonSerializable()
@HiveType(typeId: -32 + 94)
class AppAnalyticsData implements IJsonObject {
  @HiveField(0)
  final int appOpenedCount;
  @HiveField(1)
  final bool isAppRated;

  AppAnalyticsData({
    @required this.appOpenedCount,
    @required this.isAppRated,
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
    return 'AppAnalyticsData{appOpenedCount: $appOpenedCount,'
        ' isAppRated: $isAppRated}';
  }

  AppAnalyticsData copyWith({
    int appOpenedCount,
    bool isAppRated,
  }) =>
      AppAnalyticsData(
        appOpenedCount: appOpenedCount ?? this.appOpenedCount,
        isAppRated: isAppRated ?? this.isAppRated,
      );

  factory AppAnalyticsData.fromJson(Map<String, dynamic> json) =>
      _$AppAnalyticsDataFromJson(json);

  factory AppAnalyticsData.fromJsonString(String jsonString) =>
      _$AppAnalyticsDataFromJson(jsonDecode(jsonString));

  static List<AppAnalyticsData> listFromJsonString(String str) =>
      List<AppAnalyticsData>.from(
          json.decode(str).map((x) => AppAnalyticsData.fromJson(x)));

  @override
  Map<String, dynamic> toJson() => _$AppAnalyticsDataToJson(this);

  String toJsonString() => jsonEncode(_$AppAnalyticsDataToJson(this));
}
