import 'dart:convert';

import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timeline_settings_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
@HiveType()
// @HiveType(typeId: -32 + 46)
@JsonSerializable(explicitToJson: true)
class TimelineSettings extends IPreferencesObject implements ITimelineSettings {
  @override
  @HiveField(1)
  @JsonKey(name: "only_with_media")
  final bool onlyWithMedia;

  @override
  @HiveField(2)
  @JsonKey(name: "exclude_replies")
  final bool excludeReplies;

  @override
  @HiveField(3)
  @JsonKey(name: "exclude_nsfw_sensitive")
  final bool excludeNsfwSensitive;

  @override
  @HiveField(4)
  @JsonKey(name: "only_remote")
  final bool onlyRemote;

  @override
  @HiveField(5)
  @JsonKey(name: "only_local")
  final bool onlyLocal;

  @override
  @HiveField(6)
  @JsonKey(name: "with_muted")
  final bool withMuted;

  @HiveField(7)
  @JsonKey(name: "exclude_visibilities_strings")
  final List<String> excludeVisibilitiesStrings;

  @HiveField(8)
  @JsonKey(name: "type_string")
  final String typeString;

  @override
  @HiveField(9)
  @JsonKey(name: "only_in_list_with_remote_id")
  final String onlyInListWithRemoteId;

  @override
  @HiveField(10)
  @JsonKey(name: "with_hashtag")
  final String withHashtag;

  @HiveField(11)
  @JsonKey(name: "timeline_reply_visibility_filter_string")
  final String timelineReplyVisibilityFilterString;

  @HiveField(12)
  final String id;

  @override
  @HiveField(13)
  @JsonKey(name: "only_from_account_with_remote_id")
  final String onlyFromAccountWithRemoteId;

  @override
  @HiveField(14)
  @JsonKey(name: "only_pinned")
  final bool onlyPinned;

  @override
  @HiveField(15)
  @JsonKey(name: "exclude_reblogs")
  final bool excludeReblogs;

  TimelineSettings({
    @required this.id,
    @required this.onlyWithMedia,
    @required this.excludeReplies,
    @required this.excludeNsfwSensitive,
    @required this.onlyRemote,
    @required this.onlyLocal,
    @required this.withMuted,
    @required this.excludeVisibilitiesStrings,
    @required this.typeString,
    @required this.onlyInListWithRemoteId,
    @required this.withHashtag,
    @required this.timelineReplyVisibilityFilterString,
    @required this.onlyFromAccountWithRemoteId,
    @required this.onlyPinned,
    @required this.excludeReblogs,
  });

  TimelineSettings.home({
    @required String id,
    @required bool onlyLocal,
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
  }) : this(
          id: id,
          onlyWithMedia: null,
          excludeReplies: null,
          excludeNsfwSensitive: null,
          onlyRemote: null,
          onlyLocal: onlyLocal,
          withMuted: withMuted,
          excludeVisibilitiesStrings: excludeVisibilities
              ?.map((excludeVisibility) => excludeVisibility.toJsonValue())
              ?.toList(),
          typeString: TimelineType.home.toJsonValue(),
          onlyInListWithRemoteId: null,
          withHashtag: null,
          timelineReplyVisibilityFilterString: null,
          onlyFromAccountWithRemoteId: null,
          onlyPinned: null,
          excludeReblogs: null,
        );

  TimelineSettings.public({
    @required String id,
    @required bool onlyWithMedia,
    @required bool onlyRemote,
    @required bool onlyLocal,
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
  }) : this(
          id: id,
          onlyWithMedia: onlyWithMedia,
          excludeReplies: null,
          excludeNsfwSensitive: null,
          onlyRemote: onlyRemote,
          onlyLocal: onlyLocal,
          withMuted: withMuted,
          excludeVisibilitiesStrings: excludeVisibilities
              ?.map((excludeVisibility) => excludeVisibility.toJsonValue())
              ?.toList(),
          typeString: TimelineType.public.toJsonValue(),
          onlyInListWithRemoteId: null,
          withHashtag: null,
          timelineReplyVisibilityFilterString: null,
          onlyFromAccountWithRemoteId: null,
          onlyPinned: null,
          excludeReblogs: null,
        );

  TimelineSettings.hashtag({
    @required String id,
    @required bool onlyWithMedia,
    @required bool onlyLocal,
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
    @required String withHashtag,
  }) : this(
          id: id,
          onlyWithMedia: onlyWithMedia,
          excludeReplies: null,
          excludeNsfwSensitive: null,
          onlyRemote: null,
          onlyLocal: onlyLocal,
          withMuted: withMuted,
          excludeVisibilitiesStrings: excludeVisibilities
              ?.map((excludeVisibility) => excludeVisibility.toJsonValue())
              ?.toList(),
          typeString: TimelineType.hashtag.toJsonValue(),
          onlyInListWithRemoteId: null,
          withHashtag: withHashtag,
          timelineReplyVisibilityFilterString: null,
          onlyFromAccountWithRemoteId: null,
          onlyPinned: null,
          excludeReblogs: null,
        );

  TimelineSettings.list({
    @required String id,
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
    @required String onlyInListWithRemoteId,
  }) : this(
          id: id,
          onlyWithMedia: null,
          excludeReplies: null,
          excludeNsfwSensitive: null,
          onlyRemote: null,
          onlyLocal: null,
          withMuted: withMuted,
          excludeVisibilitiesStrings: excludeVisibilities
              ?.map((excludeVisibility) => excludeVisibility.toJsonValue())
              ?.toList(),
          typeString: TimelineType.list.toJsonValue(),
          onlyInListWithRemoteId: onlyInListWithRemoteId,
          withHashtag: null,
          timelineReplyVisibilityFilterString: null,
          onlyFromAccountWithRemoteId: null,
          onlyPinned: null,
          excludeReblogs: null,
        );

  TimelineSettings.account({
    @required String id,
    @required String onlyFromAccountWithRemoteId,
    @required bool onlyWithMedia,
    @required bool excludeReplies,
    @required bool excludeReblogs,
    @required bool onlyPinned,
  }) : this(
          id: id,
          onlyWithMedia: onlyWithMedia,
          excludeReplies: excludeReplies,
          excludeNsfwSensitive: null,
          onlyRemote: null,
          onlyLocal: null,
          withMuted: null,
          excludeVisibilitiesStrings: [],
          typeString: TimelineType.account.toJsonValue(),
          onlyInListWithRemoteId: null,
          withHashtag: null,
          timelineReplyVisibilityFilterString: null,
          onlyFromAccountWithRemoteId: onlyFromAccountWithRemoteId,
          onlyPinned: onlyPinned,
          excludeReblogs: excludeReblogs,
        );

  TimelineSettings copyWith({
    String id,
    bool onlyWithMedia,
    bool excludeReplies,
    bool excludeNsfwSensitive,
    bool onlyRemote,
    bool onlyLocal,
    bool withMuted,
    List<String> excludeVisibilitiesStrings,
    String typeString,
    String onlyInListWithRemoteId,
    bool withHashtag,
    String timelineReplyVisibilityFilterString,
    String onlyFromAccountWithRemoteId,
    bool excludeReblogs,
    bool onlyPinned,
  }) =>
      TimelineSettings(
        id: id ?? this.id,
        onlyWithMedia: onlyWithMedia ?? this.onlyWithMedia,
        excludeReplies: excludeReplies ?? this.excludeReplies,
        excludeNsfwSensitive: excludeNsfwSensitive ?? this.excludeNsfwSensitive,
        onlyRemote: onlyRemote ?? this.onlyRemote,
        onlyLocal: onlyLocal ?? this.onlyLocal,
        withMuted: withMuted ?? this.withMuted,
        excludeVisibilitiesStrings:
            excludeVisibilitiesStrings ?? this.excludeVisibilitiesStrings,
        typeString: typeString ?? this.typeString,
        onlyInListWithRemoteId:
            onlyInListWithRemoteId ?? this.onlyInListWithRemoteId,
        withHashtag: withHashtag ?? this.withHashtag,
        timelineReplyVisibilityFilterString:
            timelineReplyVisibilityFilterString ??
                this.timelineReplyVisibilityFilterString,
        onlyFromAccountWithRemoteId:
            onlyFromAccountWithRemoteId ?? this.onlyFromAccountWithRemoteId,
        excludeReblogs:  excludeReblogs ?? this.excludeReblogs,
        onlyPinned:  onlyPinned ?? this.onlyPinned,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimelineSettings &&
          runtimeType == other.runtimeType &&
          onlyWithMedia == other.onlyWithMedia &&
          excludeReplies == other.excludeReplies &&
          excludeNsfwSensitive == other.excludeNsfwSensitive &&
          onlyRemote == other.onlyRemote &&
          onlyLocal == other.onlyLocal &&
          withMuted == other.withMuted &&
          excludeVisibilitiesStrings == other.excludeVisibilitiesStrings &&
          typeString == other.typeString &&
          onlyInListWithRemoteId == other.onlyInListWithRemoteId &&
          withHashtag == other.withHashtag &&
          timelineReplyVisibilityFilterString ==
              other.timelineReplyVisibilityFilterString &&
          id == other.id &&
          onlyFromAccountWithRemoteId == other.onlyFromAccountWithRemoteId &&
          onlyPinned == other.onlyPinned &&
          excludeReblogs == other.excludeReblogs;

  @override
  int get hashCode =>
      onlyWithMedia.hashCode ^
      excludeReplies.hashCode ^
      excludeNsfwSensitive.hashCode ^
      onlyRemote.hashCode ^
      onlyLocal.hashCode ^
      withMuted.hashCode ^
      excludeVisibilitiesStrings.hashCode ^
      typeString.hashCode ^
      onlyInListWithRemoteId.hashCode ^
      withHashtag.hashCode ^
      timelineReplyVisibilityFilterString.hashCode ^
      id.hashCode ^
      onlyFromAccountWithRemoteId.hashCode ^
      onlyPinned.hashCode ^
      excludeReblogs.hashCode;

  @override
  String toString() {
    return 'TimelineSettings{'
        ' onlyWithMedia: $onlyWithMedia,'
        ' excludeReplies: $excludeReplies,'
        ' excludeNsfwSensitive: $excludeNsfwSensitive,'
        ' onlyRemote: $onlyRemote, onlyLocal: $onlyLocal,'
        ' withMuted: $withMuted,'
        ' excludeVisibilitiesStrings: $excludeVisibilitiesStrings,'
        ' remoteTypeString: $typeString,'
        ' onlyInListWithRemoteId: $onlyInListWithRemoteId,'
        ' withHashtag: $withHashtag,'
        ' timelineReplyVisibilityFilterString:'
        ' $timelineReplyVisibilityFilterString,'
        ' id: $id, onlyFromAccountWithRemoteId: $onlyFromAccountWithRemoteId,'
        ' onlyPinned: $onlyPinned, excludeReblogs: $excludeReblogs}';
  }

  factory TimelineSettings.fromJson(Map<String, dynamic> json) =>
      _$TimelineSettingsFromJson(json);

  factory TimelineSettings.fromJsonString(String jsonString) =>
      _$TimelineSettingsFromJson(jsonDecode(jsonString));

  static List<TimelineSettings> listFromJsonString(String str) =>
      List<TimelineSettings>.from(
          json.decode(str).map((x) => TimelineSettings.fromJson(x)));

  @override
  Map<String, dynamic> toJson() => _$TimelineSettingsToJson(this);

  String toJsonString() => jsonEncode(_$TimelineSettingsToJson(this));

  @override
  List<PleromaVisibility> get excludeVisibilities => excludeVisibilitiesStrings
      ?.map((excludeVisibilityString) =>
          excludeVisibilityString.toPleromaVisibility())
      ?.toList();

  @override
  TimelineType get type => typeString?.toTimelineType();

  @override
  PleromaTimelineReplyVisibilityFilter get timelineReplyVisibilityFilter =>
      timelineReplyVisibilityFilterString?.toTimelineReplyVisibilityFilter();
}

abstract class ITimelineSettings {
  bool get onlyWithMedia;

  bool get excludeReplies;

  bool get excludeNsfwSensitive;

  bool get onlyRemote;

  bool get onlyLocal;

  bool get withMuted;

  List<PleromaVisibility> get excludeVisibilities;

  TimelineType get type;

  String get onlyInListWithRemoteId;

  String get onlyFromAccountWithRemoteId;

  String get withHashtag;

  PleromaTimelineReplyVisibilityFilter get timelineReplyVisibilityFilter;

  bool get onlyPinned;

  bool get excludeReblogs;
}
