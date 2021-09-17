import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/app/ui/settings/font_size/ui_settings_font_size_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'ui_settings_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 91)
class UiSettings implements IJsonObj, ISettings<UiSettings> {
  @HiveField(0)
  @JsonKey(name: 'theme_id')
  final String? themeId;

  @HiveField(1)
  @JsonKey(name: 'status_font_size')
  final String statusFontSizeString;

  UiSettingsFontSize get statusFontSize =>
      statusFontSizeString.toUiSettingsFontSize();

  UiSettings({
    required this.themeId,
    required this.statusFontSizeString,
  });

  UiSettings.fromEnum({
    required String? themeId,
    required UiSettingsFontSize statusFontSize,
  }) : this(
          themeId: themeId,
          statusFontSizeString: statusFontSize.toJsonValue(),
        );

  static UiSettings fromJson(Map<String, dynamic> json) =>
      _$UiSettingsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UiSettingsToJson(this);

  @override
  UiSettings clone() => copyWith();

  UiSettings copyWith({
    String? themeId,
    UiSettingsFontSize? statusFontSize,
  }) =>
      UiSettings.fromEnum(
        themeId: themeId ?? this.themeId,
        statusFontSize: statusFontSize ?? this.statusFontSize,
      );

  @override
  String toString() {
    return 'UiSettings{'
        'themeId: $themeId, '
        'statusFontSize: $statusFontSizeString'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UiSettings &&
          runtimeType == other.runtimeType &&
          themeId == other.themeId &&
          statusFontSizeString == other.statusFontSizeString;

  @override
  int get hashCode => themeId.hashCode ^ statusFontSizeString.hashCode;
}
