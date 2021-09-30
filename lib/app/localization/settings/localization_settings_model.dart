import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/localization/localization_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'localization_settings_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 90)
class LocalizationSettings
    implements IJsonObj, ISettings<LocalizationSettings> {
  @HiveField(0)
  @JsonKey(name: 'localization_locale')
  final LocalizationLocale? localizationLocale;

  const LocalizationSettings({
    required this.localizationLocale,
  });

  static LocalizationSettings fromJson(Map<String, dynamic> json) =>
      _$LocalizationSettingsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LocalizationSettingsToJson(this);

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
    LocalizationLocale? localizationLocale,
  }) =>
      LocalizationSettings(
        localizationLocale: localizationLocale ?? this.localizationLocale,
      );
}
