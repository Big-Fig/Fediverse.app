import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/localization/localization_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'localization_settings_model.g.dart';

part 'localization_settings_model.freezed.dart';

@freezed
@HiveType(typeId: -32 + 90)
class LocalizationSettings
    with _$LocalizationSettings
    implements IJsonObj, ISettings<LocalizationSettings> {
  const LocalizationSettings._();
  const factory LocalizationSettings({
    @HiveField(0)
    @JsonKey(name: 'localization_locale')
        required LocalizationLocale? localizationLocale,
  }) = _LocalizationSettings;

  factory LocalizationSettings.fromJson(Map<String, dynamic> json) =>
      _$LocalizationSettingsFromJson(json);

  @override
  LocalizationSettings clone() => copyWith();
}
