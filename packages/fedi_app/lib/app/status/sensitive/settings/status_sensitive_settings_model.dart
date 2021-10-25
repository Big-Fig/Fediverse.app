import 'package:fedi_app/app/settings/settings_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'status_sensitive_settings_model.freezed.dart';

// ignore_for_file: no-magic-number
part 'status_sensitive_settings_model.g.dart';

@HiveType(typeId: -32 + 85)
@freezed
class StatusSensitiveSettings
    with _$StatusSensitiveSettings
    implements IJsonObj, ISettings<StatusSensitiveSettings> {
  const StatusSensitiveSettings._();

  Duration? get nsfwDisplayDelayDuration =>
      nsfwDisplayDelayDurationMicrosecondsTotal != null
          ? Duration(
              microseconds: nsfwDisplayDelayDurationMicrosecondsTotal!,
            )
          : null;

  const factory StatusSensitiveSettings({
    @HiveField(0)
    @JsonKey(name: 'is_always_show_spoiler')
        required bool isAlwaysShowSpoiler,
    @HiveField(1)
    @JsonKey(name: 'is_always_show_nsfw')
        required bool isAlwaysShowNsfw,
    @HiveField(2)
    @JsonKey(name: 'nsfw_display_delay_duration_seconds_total')
        required int? nsfwDisplayDelayDurationMicrosecondsTotal,
    @HiveField(3)
    @JsonKey(name: 'is_need_replace_blur_with_fill')
        required bool? isNeedReplaceBlurWithFill,
  }) = _StatusSensitiveSettings;

  factory StatusSensitiveSettings.fromJson(Map<String, dynamic> json) =>
      _$StatusSensitiveSettingsFromJson(json);
}
