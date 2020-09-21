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
  @JsonKey(name: "only_no_replies")
  final bool onlyNoReplies;

  @override
  @HiveField(3)
  @JsonKey(name: "only_no_nsfw_sensitive")
  final bool onlyNoNsfwSensitive;

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
  @JsonKey(name: "exclude_visibilities")
  final List<String> excludeVisibilitiesStrings;

  @HiveField(8)
  @JsonKey(name: "remote_type")
  final String remoteTypeString;

  @override
  @HiveField(9)
  @JsonKey(name: "only_in_list_with_remote_id")
  final String onlyInListWithRemoteId;

  @override
  @HiveField(10)
  @JsonKey(name: "with_hashtag")
  final String withHashtag;

  @HiveField(11)
  @JsonKey(name: "timeline_reply_visibility_filter")
  final String timelineReplyVisibilityFilterString;

  @HiveField(12)
  final String id;

  @override
  @HiveField(13)
  @JsonKey(name: "only_from_account_with_remote_id")
  final String onlyFromAccountWithRemoteId;

  TimelineSettings({
    @required this.id,
    @required this.onlyWithMedia,
    @required this.onlyNoReplies,
    @required this.onlyNoNsfwSensitive,
    @required this.onlyRemote,
    @required this.onlyLocal,
    @required this.withMuted,
    @required this.excludeVisibilitiesStrings,
    @required this.remoteTypeString,
    @required this.onlyInListWithRemoteId,
    @required this.withHashtag,
    @required this.timelineReplyVisibilityFilterString,
    @required this.onlyFromAccountWithRemoteId,
  });

  TimelineSettings.home({
    @required String id,
    @required bool onlyLocal,
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
  }) : this(
          id: id,
          onlyWithMedia: null,
          onlyNoReplies: null,
          onlyNoNsfwSensitive: null,
          onlyRemote: null,
          onlyLocal: onlyLocal,
          withMuted: withMuted,
          excludeVisibilitiesStrings: excludeVisibilities
              ?.map((excludeVisibility) => excludeVisibility.toJsonValue())
              ?.toList(),
          remoteTypeString: TimelineRemoteType.home.toJsonValue(),
          onlyInListWithRemoteId: null,
          withHashtag: null,
          timelineReplyVisibilityFilterString: null,
          onlyFromAccountWithRemoteId: null,
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
          onlyNoReplies: null,
          onlyNoNsfwSensitive: null,
          onlyRemote: onlyRemote,
          onlyLocal: onlyLocal,
          withMuted: withMuted,
          excludeVisibilitiesStrings: excludeVisibilities
              ?.map((excludeVisibility) => excludeVisibility.toJsonValue())
              ?.toList(),
          remoteTypeString: TimelineRemoteType.public.toJsonValue(),
          onlyInListWithRemoteId: null,
          withHashtag: null,
          timelineReplyVisibilityFilterString: null,
          onlyFromAccountWithRemoteId: null,
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
          onlyNoReplies: null,
          onlyNoNsfwSensitive: null,
          onlyRemote: null,
          onlyLocal: onlyLocal,
          withMuted: withMuted,
          excludeVisibilitiesStrings: excludeVisibilities
              ?.map((excludeVisibility) => excludeVisibility.toJsonValue())
              ?.toList(),
          remoteTypeString: TimelineRemoteType.hashtag.toJsonValue(),
          onlyInListWithRemoteId: null,
          withHashtag: withHashtag,
          timelineReplyVisibilityFilterString: null,
          onlyFromAccountWithRemoteId: null,
        );

  TimelineSettings.list({
    @required String id,
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
    @required String onlyInListWithRemoteId,
  }) : this(
          id: id,
          onlyWithMedia: null,
          onlyNoReplies: null,
          onlyNoNsfwSensitive: null,
          onlyRemote: null,
          onlyLocal: null,
          withMuted: withMuted,
          excludeVisibilitiesStrings: excludeVisibilities
              ?.map((excludeVisibility) => excludeVisibility.toJsonValue())
              ?.toList(),
          remoteTypeString: TimelineRemoteType.list.toJsonValue(),
          onlyInListWithRemoteId: onlyInListWithRemoteId,
          withHashtag: null,
          timelineReplyVisibilityFilterString: null,
          onlyFromAccountWithRemoteId: null,
        );

  TimelineSettings.account({
    @required String id,
    @required String onlyFromAccountWithRemoteId,
    @required bool onlyWithMedia,
  }) : this(
          id: id,
          onlyWithMedia: onlyWithMedia,
          onlyNoReplies: null,
          onlyNoNsfwSensitive: null,
          onlyRemote: null,
          onlyLocal: null,
          withMuted: null,
          excludeVisibilitiesStrings: [],
          remoteTypeString: TimelineRemoteType.account.toJsonValue(),
          onlyInListWithRemoteId: null,
          withHashtag: null,
          timelineReplyVisibilityFilterString: null,
          onlyFromAccountWithRemoteId: onlyFromAccountWithRemoteId,
        );

  TimelineSettings copyWith({
    String id,
    bool onlyWithMedia,
    bool onlyNoReplies,
    bool onlyNoNsfwSensitive,
    bool onlyRemote,
    bool onlyLocal,
    bool withMuted,
    List<String> excludeVisibilitiesStrings,
    String remoteTypeString,
    String onlyInListWithRemoteId,
    bool withHashtag,
    String timelineReplyVisibilityFilterString,
    String onlyFromAccountWithRemoteId,
  }) =>
      TimelineSettings(
        id: id ?? this.id,
        onlyWithMedia: onlyWithMedia ?? this.onlyWithMedia,
        onlyNoReplies: onlyNoReplies ?? this.onlyNoReplies,
        onlyNoNsfwSensitive: onlyNoNsfwSensitive ?? this.onlyNoNsfwSensitive,
        onlyRemote: onlyRemote ?? this.onlyRemote,
        onlyLocal: onlyLocal ?? this.onlyLocal,
        withMuted: withMuted ?? this.withMuted,
        excludeVisibilitiesStrings:
            excludeVisibilitiesStrings ?? this.excludeVisibilitiesStrings,
        remoteTypeString: remoteTypeString ?? this.remoteTypeString,
        onlyInListWithRemoteId:
            onlyInListWithRemoteId ?? this.onlyInListWithRemoteId,
        withHashtag: withHashtag ?? this.withHashtag,
        timelineReplyVisibilityFilterString:
            timelineReplyVisibilityFilterString ??
                this.timelineReplyVisibilityFilterString,
        onlyFromAccountWithRemoteId:
            onlyFromAccountWithRemoteId ?? this.onlyFromAccountWithRemoteId,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimelineSettings &&
          runtimeType == other.runtimeType &&
          onlyWithMedia == other.onlyWithMedia &&
          onlyNoReplies == other.onlyNoReplies &&
          onlyNoNsfwSensitive == other.onlyNoNsfwSensitive &&
          onlyRemote == other.onlyRemote &&
          onlyLocal == other.onlyLocal &&
          withMuted == other.withMuted &&
          excludeVisibilitiesStrings == other.excludeVisibilitiesStrings &&
          remoteTypeString == other.remoteTypeString &&
          onlyInListWithRemoteId == other.onlyInListWithRemoteId &&
          withHashtag == other.withHashtag &&
          timelineReplyVisibilityFilterString ==
              other.timelineReplyVisibilityFilterString &&
          id == other.id &&
          onlyFromAccountWithRemoteId == other.onlyFromAccountWithRemoteId;

  @override
  int get hashCode =>
      onlyWithMedia.hashCode ^
      onlyNoReplies.hashCode ^
      onlyNoNsfwSensitive.hashCode ^
      onlyRemote.hashCode ^
      onlyLocal.hashCode ^
      withMuted.hashCode ^
      excludeVisibilitiesStrings.hashCode ^
      remoteTypeString.hashCode ^
      onlyInListWithRemoteId.hashCode ^
      withHashtag.hashCode ^
      timelineReplyVisibilityFilterString.hashCode ^
      id.hashCode ^
      onlyFromAccountWithRemoteId.hashCode;

  @override
  String toString() {
    return 'TimelineSettings{'
        ' onlyWithMedia: $onlyWithMedia,'
        ' onlyNoReplies: $onlyNoReplies,'
        ' onlyNoNsfwSensitive: $onlyNoNsfwSensitive,'
        ' onlyRemote: $onlyRemote,'
        ' onlyLocal: $onlyLocal,'
        ' withMuted: $withMuted,'
        ' excludeVisibilitiesStrings: $excludeVisibilitiesStrings,'
        ' remoteTypeString: $remoteTypeString,'
        ' onlyInListWithRemoteId: $onlyInListWithRemoteId,'
        ' withHashtag: $withHashtag,'
        ' timelineReplyVisibilityFilterString:'
        ' $timelineReplyVisibilityFilterString,'
        ' onlyFromAccountWithRemoteId: $onlyFromAccountWithRemoteId,'
        ' id: $id}';
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
  TimelineRemoteType get remoteType => remoteTypeString?.toTimelineRemoteType();

  @override
  TimelineReplyVisibilityFilter get timelineReplyVisibilityFilter =>
      timelineReplyVisibilityFilterString?.toTimelineReplyVisibilityFilter();
}

abstract class ITimelineSettings {
  bool get onlyWithMedia;

  bool get onlyNoReplies;

  bool get onlyNoNsfwSensitive;

  bool get onlyRemote;

  bool get onlyLocal;

  bool get withMuted;

  List<PleromaVisibility> get excludeVisibilities;

  TimelineRemoteType get remoteType;

  String get onlyInListWithRemoteId;

  String get onlyFromAccountWithRemoteId;

  String get withHashtag;

  TimelineReplyVisibilityFilter get timelineReplyVisibilityFilter;
}
