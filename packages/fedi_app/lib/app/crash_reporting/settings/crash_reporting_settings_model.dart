import 'package:fedi_app/app/settings/settings_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crash_reporting_settings_model.freezed.dart';

// ignore_for_file: no-magic-number
part 'crash_reporting_settings_model.g.dart';

@freezed
@HiveType(typeId: -32 + 102)
class CrashReportingSettings
    with _$CrashReportingSettings
    implements IJsonObj, ISettings<CrashReportingSettings> {
  const CrashReportingSettings._();
  const factory CrashReportingSettings({
    @HiveField(0)
    @JsonKey(name: 'reporting_enabled')
        required bool reportingEnabled,
  }) = _CrashReportingSettings;

  factory CrashReportingSettings.fromJson(Map<String, dynamic> json) =>
      _$CrashReportingSettingsFromJson(json);
}
