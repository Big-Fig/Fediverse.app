import 'package:fedi/app/settings/settings_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'crash_reporting_settings_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 102)
class CrashReportingSettings
    implements IJsonObj, ISettings<CrashReportingSettings> {
  @HiveField(0)
  @JsonKey(name: 'reporting_enabled')
  final bool reportingEnabled;

  CrashReportingSettings({
    required this.reportingEnabled,
  });

  static CrashReportingSettings fromJson(Map<String, dynamic> json) =>
      _$CrashReportingSettingsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CrashReportingSettingsToJson(this);

  @override
  CrashReportingSettings clone() => copyWith();

  CrashReportingSettings copyWith({
    bool? reportingEnabled,
  }) =>
      CrashReportingSettings(
        reportingEnabled: reportingEnabled ?? this.reportingEnabled,
      );

  @override
  String toString() {
    return 'CrashReportingSettings{'
        'reportingEnabled: $reportingEnabled'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CrashReportingSettings &&
          runtimeType == other.runtimeType &&
          reportingEnabled == other.reportingEnabled;

  @override
  int get hashCode => reportingEnabled.hashCode;
}
