import 'dart:convert';
import 'dart:io';

import 'package:fedi/Pleroma/Models/Field.dart';
import 'package:fedi/Pleroma/Models/Status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_account_edit_model.g.dart';

@JsonSerializable(explicitToJson:  true)
class PleromaAccountEdit {

  /// Whether the account has a bot flag.
  final bool bot;

  /// Whether the account should be shown in the profile directory.
  final bool discoverable;

  // The display name to use for the profile.
  @JsonKey(name: "display_name")
  final String displayName;

  /// Profile metadata name and value.
  /// (By default, max 4 fields and 255 characters per property/value)
  /// Looking at the code you should be able to form the json
  /// for fields_attributes like
  /// { 0: { name: ..., value: ... }, 1: { ... } }
  @JsonKey(name: "fields_attributes")
  final Map<int, Field> fieldsAttributes;


  /// Whether manual approval of follow requests is required.
  final bool locked;

  /// The account bio.
  final String note;

  final Source source;

  /// the type of this account.
  @JsonKey(name: "actor_type")
  final dynamic actorType;

  ///  if true, allows automatically follow moved following accounts
  @JsonKey(name: "allow_following_move")
  final bool allowFollowingMove;

  /// the scope returned under privacy key in Source subentity
  @JsonKey(name: "default_scope")
  final String defaultScope;

  @JsonKey(name: "hide_favorites")
  final bool hideFavorites;

  @JsonKey(name: "hide_followers")
  final bool hideFollowers;

  @JsonKey(name: "hide_followers_count")
  final bool hideFollowersCount;

  @JsonKey(name: "hide_follows")
  final bool hideFollows;

  @JsonKey(name: "hide_follows_count")
  final bool hideFollowsCount;

  /// if true, html tags are stripped from all statuses requested from the API
  @JsonKey(name: "no_rich_text")
  final bool noRichText;

  @JsonKey(name: "pleroma_background_image")
  final String pleromaBackgroundImage;

  /// Opaque user settings to be saved on the backend.
  /// Pleroma has mechanism that allows frontends to save blobs
  /// of json for each user on the backend.
  /// This can be used to save frontend-specific settings
  /// for a user that the backend does not need to know about.
  /// The parameter should have a form of {frontend_name: {...}}, with
  /// frontend_name identifying your type of client, e.g. pleroma_fe. It will
  /// overwrite everything under this property,
  /// but will not overwrite other frontend's settings.
  /// This information is returned in the verify_credentials endpoint.
  @JsonKey(name: "pleroma_settings_store")
  final Map<String, dynamic> pleromaSettingsStore;

  /// if true, user's role (e.g admin, moderator) will be exposed to anyone in the API
  @JsonKey(name: "show_role")
  final bool showRole;

  ///  if true, skip filtering out broken threads
  @JsonKey(name: "skip_thread_containment")
  final bool skipThreadContainment;

  PleromaAccountEdit(
      {
      this.bot,
      this.discoverable,
      this.displayName,
      this.fieldsAttributes,
      this.locked,
      this.note,
      this.source,
      this.actorType,
      this.allowFollowingMove,
      this.defaultScope,
      this.hideFavorites,
      this.hideFollowers,
      this.hideFollowersCount,
      this.hideFollows,
      this.hideFollowsCount,
      this.noRichText,
      this.pleromaBackgroundImage,
      this.pleromaSettingsStore,
      this.showRole,
      this.skipThreadContainment});

  factory PleromaAccountEdit.fromJson(Map<String, dynamic> json) =>
      _$PleromaAccountEditFromJson(json);

  factory PleromaAccountEdit.fromJsonString(String jsonString) =>
      _$PleromaAccountEditFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaAccountEditToJson(this);

  String toJsonString() => jsonEncode(_$PleromaAccountEditToJson(this));

  @override
  String toString() {
    return 'PleromaAccountEdit{bot: $bot, discoverable: $discoverable,'
        ' displayName: $displayName, fieldsAttributes: $fieldsAttributes,'
        ' locked: $locked, note: $note, source: $source, actorType: $actorType,'
        ' allowFollowingMove: $allowFollowingMove, defaultScope: $defaultScope,'
        ' hideFavorites: $hideFavorites, hideFollowers: $hideFollowers,'
        ' hideFollowersCount: $hideFollowersCount, hideFollows: $hideFollows,'
        ' hideFollowsCount: $hideFollowsCount, noRichText: $noRichText,'
        ' pleromaBackgroundImage: $pleromaBackgroundImage,'
        ' pleromaSettingsStore: $pleromaSettingsStore,'
        ' showRole: $showRole, skipThreadContainment: $skipThreadContainment}';
  }


}



class PleromaAccountFiles {
  /// Avatar image
  final File avatar;
  final File header;

  PleromaAccountFiles({this.avatar, this.header});

  @override
  String toString() {
    return 'PleromaAccountFiles{avatar: $avatar, header: $header}';
  }


}
