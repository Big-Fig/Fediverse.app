import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/localization/localization_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'post_status_settings_model.freezed.dart';

// ignore_for_file: no-magic-number
part 'post_status_settings_model.g.dart';

@HiveType(typeId: -32 + 84)
@freezed
class PostStatusSettings
    with _$PostStatusSettings
    implements IJsonObj, ISettings<PostStatusSettings> {
  UnifediApiVisibility get defaultVisibilityAsUnifediApi =>
      defaultVisibilityString.toUnifediApiVisibility();

  const PostStatusSettings._();

  const factory PostStatusSettings({
    @HiveField(0)
    @JsonKey(name: 'mark_media_as_nsfw_on_attach')
        required bool markMediaAsNsfwOnAttach,
    @HiveField(1)
    @JsonKey(name: 'default_visibility')
        required String defaultVisibilityString,
    @HiveField(2)
    @JsonKey(name: 'default_status_locale')
        required LocalizationLocale? defaultStatusLocale,
    @HiveField(3)
    @JsonKey(name: 'dont_upload_media_during_editing_on_attach')
        required bool dontUploadMediaDuringEditing,
  }) = _PostStatusSettings;

  factory PostStatusSettings.fromJson(Map<String, dynamic> json) =>
      _$PostStatusSettingsFromJson(json);

  @override
  PostStatusSettings clone() => copyWith();
}
