import 'dart:convert';

import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/json/json_model.dart';
import 'package:fedi/localization/localization_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'localization_settings_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 87)
class LocalizationSettings
    implements IJsonObject, ISettings<LocalizationSettings> {
  @HiveField(0)
  @JsonKey(name: "localization_locale")
  final LocalizationLocale localizationLocale;

  LocalizationSettings({
    @required this.localizationLocale,
  });

  factory LocalizationSettings.fromJson(Map<String, dynamic> json) =>
      _$LocalizationSettingsFromJson(json);

  factory LocalizationSettings.fromJsonString(String jsonString) =>
      _$LocalizationSettingsFromJson(jsonDecode(jsonString));

  static List<LocalizationSettings> listFromJsonString(String str) =>
      List<LocalizationSettings>.from(
          json.decode(str).map((x) => LocalizationSettings.fromJson(x)));

  @override
  Map<String, dynamic> toJson() => _$LocalizationSettingsToJson(this);

  String toJsonString() => jsonEncode(_$LocalizationSettingsToJson(this));

  @override
  LocalizationSettings clone() => copyWith();

  @override
  String toString() {
    return 'LocalizationSettings{localizationLocale: $localizationLocale}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalizationSettings &&
          runtimeType == other.runtimeType &&
          localizationLocale == other.localizationLocale;

  @override
  int get hashCode => localizationLocale.hashCode;

  LocalizationSettings copyWith({
    LocalizationLocale localizationLocale,
  }) =>
      LocalizationSettings(
        localizationLocale: localizationLocale ?? this.localizationLocale,
      );
}
