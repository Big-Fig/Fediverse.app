import 'dart:convert';

import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/app/ui/settings/font_size/ui_settings_font_size_model.dart';
import 'package:fedi/json/json_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ui_settings_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 91)
class UiSettings implements IJsonObject, ISettings<UiSettings> {
  @HiveField(0)
  @JsonKey(name: "theme_id")
  final String themeId;

  @HiveField(1)
  @JsonKey(name: "status_font_size")
  final String statusFontSize;

  UiSettingsFontSize get statusFontSizeAsUiSettingsFontSize =>
      statusFontSize?.toUiSettingsFontSize();

  UiSettings({
    @required this.themeId,
    @required this.statusFontSize,
  });

  factory UiSettings.fromJson(Map<String, dynamic> json) =>
      _$UiSettingsFromJson(json);

  factory UiSettings.fromJsonString(String jsonString) =>
      _$UiSettingsFromJson(jsonDecode(jsonString));

  static List<UiSettings> listFromJsonString(String str) =>
      List<UiSettings>.from(
          json.decode(str).map((x) => UiSettings.fromJson(x)));

  @override
  Map<String, dynamic> toJson() => _$UiSettingsToJson(this);

  String toJsonString() => jsonEncode(_$UiSettingsToJson(this));

  @override
  UiSettings clone() => copyWith();

  UiSettings copyWith({
    String themeId,
    String statusFontSize,
  }) =>
      UiSettings(
        themeId: themeId ?? this.themeId,
        statusFontSize: statusFontSize ?? this.statusFontSize,
      );

  @override
  String toString() {
    return 'UiSettings{themeId: $themeId, statusFontSize: $statusFontSize}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UiSettings &&
          runtimeType == other.runtimeType &&
          themeId == other.themeId &&
          statusFontSize == other.statusFontSize;

  @override
  int get hashCode => themeId.hashCode ^ statusFontSize.hashCode;
}
