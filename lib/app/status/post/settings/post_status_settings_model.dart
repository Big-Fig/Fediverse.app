import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/localization/localization_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:unifedi_api/unifedi_api.dart';

// ignore_for_file: no-magic-number
part 'post_status_settings_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 84)
class PostStatusSettings implements IJsonObj, ISettings<PostStatusSettings> {
  @HiveField(0)
  @JsonKey(name: 'mark_media_as_nsfw_on_attach')
  final bool markMediaAsNsfwOnAttach;

  @HiveField(1)
  @JsonKey(name: 'default_visibility')
  final String defaultVisibilityString;

  @HiveField(2)
  @JsonKey(name: 'default_status_locale')
  final LocalizationLocale? defaultStatusLocale;
  @HiveField(3)
  @JsonKey(name: 'dont_upload_media_during_editing_on_attach')
  final bool dontUploadMediaDuringEditing;

  UnifediApiVisibility get defaultVisibilityAsUnifediApi =>
      defaultVisibilityString.toUnifediApiVisibility();

  PostStatusSettings({
    required this.markMediaAsNsfwOnAttach,
    required this.defaultVisibilityString,
    required this.defaultStatusLocale,
    required this.dontUploadMediaDuringEditing,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostStatusSettings &&
          runtimeType == other.runtimeType &&
          markMediaAsNsfwOnAttach == other.markMediaAsNsfwOnAttach &&
          defaultVisibilityString == other.defaultVisibilityString &&
          defaultStatusLocale == other.defaultStatusLocale &&
          dontUploadMediaDuringEditing == other.dontUploadMediaDuringEditing;

  @override
  int get hashCode =>
      markMediaAsNsfwOnAttach.hashCode ^
      defaultVisibilityString.hashCode ^
      defaultStatusLocale.hashCode ^
      dontUploadMediaDuringEditing.hashCode;

  @override
  String toString() {
    return 'PostStatusSettings{'
        'markMediaAsNsfwOnAttach: $markMediaAsNsfwOnAttach, '
        'defaultVisibilityString: $defaultVisibilityString, '
        'defaultStatusLocale: $defaultStatusLocale, '
        'dontUploadMediaDuringEditing: $dontUploadMediaDuringEditing'
        '}';
  }

  static PostStatusSettings fromJson(Map<String, dynamic> json) =>
      _$PostStatusSettingsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PostStatusSettingsToJson(this);

  @override
  PostStatusSettings clone() => copyWith();

  PostStatusSettings copyWith({
    bool? markMediaAsNsfwOnAttach,
    String? defaultVisibilityString,
    LocalizationLocale? defaultStatusLocale,
    bool? dontUploadMediaDuringEditing,
  }) =>
      PostStatusSettings(
        markMediaAsNsfwOnAttach:
            markMediaAsNsfwOnAttach ?? this.markMediaAsNsfwOnAttach,
        defaultVisibilityString:
            defaultVisibilityString ?? this.defaultVisibilityString,
        defaultStatusLocale: defaultStatusLocale ?? this.defaultStatusLocale,
        dontUploadMediaDuringEditing:
            dontUploadMediaDuringEditing ?? this.dontUploadMediaDuringEditing,
      );
}
