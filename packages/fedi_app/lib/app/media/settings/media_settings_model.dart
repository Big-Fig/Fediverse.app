import 'package:fedi_app/app/settings/settings_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'media_settings_model.g.dart';

part 'media_settings_model.freezed.dart';

@freezed
@HiveType(typeId: -32 + 88)
class MediaSettings
    with _$MediaSettings
    implements IJsonObj, ISettings<MediaSettings> {
  const MediaSettings._();

  const factory MediaSettings({
    @HiveField(0) @JsonKey(name: 'auto_init') required bool autoInit,
    @HiveField(1) @JsonKey(name: 'auto_play') required bool autoPlay,
  }) = _MediaSettings;

  factory MediaSettings.fromJson(Map<String, dynamic> json) =>
      _$MediaSettingsFromJson(json);
}
