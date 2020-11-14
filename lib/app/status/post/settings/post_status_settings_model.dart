import 'dart:convert';

import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/json/json_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_status_settings_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 82)
class PostStatusSettings implements IJsonObject, ISettings<PostStatusSettings> {
  @HiveField(0)
  @JsonKey(name: "mark_media_as_nsfw_on_attach")
  final bool markMediaAsNsfwOnAttach;

  @HiveField(1)
  @JsonKey(name: "default_visibility")
  final String defaultVisibilityString;

  PleromaVisibility get defaultVisibilityPleroma =>
      defaultVisibilityString.toPleromaVisibility();

  PostStatusSettings({
    @required this.markMediaAsNsfwOnAttach,
    @required this.defaultVisibilityString,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostStatusSettings &&
          runtimeType == other.runtimeType &&
          markMediaAsNsfwOnAttach == other.markMediaAsNsfwOnAttach &&
          defaultVisibilityString == other.defaultVisibilityString;

  @override
  int get hashCode =>
      markMediaAsNsfwOnAttach.hashCode ^ defaultVisibilityString.hashCode;

  @override
  String toString() {
    return 'PostStatusSettings{'
        'markMediaAsNsfwOnAttach: $markMediaAsNsfwOnAttach,'
        ' defaultVisibilityString: $defaultVisibilityString}';
  }

  factory PostStatusSettings.fromJson(Map<String, dynamic> json) =>
      _$PostStatusSettingsFromJson(json);

  factory PostStatusSettings.fromJsonString(String jsonString) =>
      _$PostStatusSettingsFromJson(jsonDecode(jsonString));

  static List<PostStatusSettings> listFromJsonString(String str) =>
      List<PostStatusSettings>.from(
          json.decode(str).map((x) => PostStatusSettings.fromJson(x)));

  @override
  Map<String, dynamic> toJson() => _$PostStatusSettingsToJson(this);

  String toJsonString() => jsonEncode(_$PostStatusSettingsToJson(this));

  @override
  PostStatusSettings clone() => copyWith();

  PostStatusSettings copyWith({
    bool markMediaAsNsfwOnAttach,
    String defaultVisibilityString,
  }) =>
      PostStatusSettings(
        markMediaAsNsfwOnAttach:
            markMediaAsNsfwOnAttach ?? this.markMediaAsNsfwOnAttach,
        defaultVisibilityString:
            defaultVisibilityString ?? this.defaultVisibilityString,
      );
}
