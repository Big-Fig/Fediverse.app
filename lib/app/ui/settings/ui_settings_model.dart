import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/app/ui/settings/font_size/ui_settings_font_size_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number

part 'ui_settings_model.freezed.dart';

part 'ui_settings_model.g.dart';

@HiveType(typeId: -32 + 91)
@freezed
class UiSettings with _$UiSettings implements IJsonObj, ISettings<UiSettings> {
  const UiSettings._();

  UiSettingsFontSize get statusFontSize =>
      statusFontSizeString.toUiSettingsFontSize();

  const factory UiSettings({
    @HiveField(0) @JsonKey(name: 'theme_id') required String? themeId,
    @HiveField(1)
    @JsonKey(name: 'status_font_size')
        required String statusFontSizeString,
  }) = _UiSettings;

  static UiSettings fromEnum({
    required String? themeId,
    required UiSettingsFontSize statusFontSize,
  }) =>
      UiSettings(
        themeId: themeId,
        statusFontSizeString: statusFontSize.toJsonValue(),
      );

  factory UiSettings.fromJson(Map<String, dynamic> json) =>
      _$UiSettingsFromJson(json);

  @override
  UiSettings clone() => copyWith();
}
