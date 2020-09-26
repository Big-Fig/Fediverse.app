import 'dart:convert';

import 'package:fedi/enum/enum_values.dart';
import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/list/pleroma_list_model.dart';
import 'package:fedi/pleroma/tag/pleroma_tag_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timeline_settings_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
@HiveType()
// @HiveType(typeId: -32 + 79)
@JsonSerializable(explicitToJson: true)
class TimelineSettings extends IPreferencesObject {
  static TimelineSettings createDefaultPublicSettings() =>
      TimelineSettings.public(
        onlyWithMedia: false,
        onlyRemote: false,
        onlyLocal: false,
        withMuted: false,
        excludeVisibilities: [],
      );

  static TimelineSettings createDefaultHomeSettings() => TimelineSettings.home(
        onlyLocal: false,
        withMuted: false,
        excludeVisibilities: [],
      );

  static TimelineSettings createDefaultCustomListSettings({
    @required IPleromaList onlyInRemoteList,
  }) =>
      TimelineSettings.list(
        withMuted: false,
        excludeVisibilities: [],
        onlyInRemoteList: onlyInRemoteList,
      );

  static TimelineSettings createDefaultHashtagSettings({
    @required IPleromaTag withRemoteHashtag,
  }) =>
      TimelineSettings.hashtag(
        onlyWithMedia: false,
        onlyLocal: false,
        withMuted: false,
        excludeVisibilities: [],
        withRemoteHashtag: withRemoteHashtag,
      );

  static TimelineSettings createDefaultAccountSettings({
    @required IPleromaAccount onlyFromRemoteAccount,
  }) =>
      TimelineSettings.account(
        onlyWithMedia: false,
        excludeReblogs: false,
        excludeReplies: false,
        onlyPinned: false,
        onlyFromRemoteAccount: onlyFromRemoteAccount,
      );

  @HiveField(1)
  @JsonKey(name: "only_with_media")
  final bool onlyWithMedia;

  @HiveField(2)
  @JsonKey(name: "exclude_replies")
  final bool excludeReplies;

  @HiveField(3)
  @JsonKey(name: "exclude_nsfw_sensitive")
  final bool excludeNsfwSensitive;

  @HiveField(4)
  @JsonKey(name: "only_remote")
  final bool onlyRemote;

  @HiveField(5)
  @JsonKey(name: "only_local")
  final bool onlyLocal;

  @HiveField(6)
  @JsonKey(name: "with_muted")
  final bool withMuted;

  @HiveField(7)
  @JsonKey(name: "exclude_visibilities_strings")
  final List<String> excludeVisibilitiesStrings;

  @HiveField(9)
  @JsonKey(name: "only_in_list")
  final PleromaList onlyInRemoteList;

  @HiveField(10)
  @JsonKey(name: "with_remote_hashtag")
  final PleromaTag withRemoteHashtag;

  @HiveField(11)
  @JsonKey(name: "timeline_reply_visibility_filter_string")
  final String timelineSettingsReplyVisibilityFilterString;

  @HiveField(13)
  @JsonKey(name: "only_from_remote_account")
  final PleromaAccount onlyFromRemoteAccount;

  @HiveField(14)
  @JsonKey(name: "only_pinned")
  final bool onlyPinned;

  @HiveField(15)
  @JsonKey(name: "exclude_reblogs")
  final bool excludeReblogs;

  TimelineSettings({
    @required this.onlyWithMedia,
    @required this.excludeReplies,
    @required this.excludeNsfwSensitive,
    @required this.onlyRemote,
    @required this.onlyLocal,
    @required this.withMuted,
    @required this.excludeVisibilitiesStrings,
    @required this.onlyInRemoteList,
    @required this.withRemoteHashtag,
    @required this.timelineSettingsReplyVisibilityFilterString,
    @required this.onlyFromRemoteAccount,
    @required this.onlyPinned,
    @required this.excludeReblogs,
  });

  TimelineSettings.home({
    @required bool onlyLocal,
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
  }) : this(
          onlyWithMedia: null,
          excludeReplies: null,
          excludeNsfwSensitive: null,
          onlyRemote: null,
          onlyLocal: onlyLocal,
          withMuted: withMuted,
          excludeVisibilitiesStrings: excludeVisibilities
              ?.map((excludeVisibility) => excludeVisibility.toJsonValue())
              ?.toList(),
          onlyInRemoteList: null,
          withRemoteHashtag: null,
          timelineSettingsReplyVisibilityFilterString: null,
          onlyFromRemoteAccount: null,
          onlyPinned: null,
          excludeReblogs: null,
        );

  TimelineSettings.public({
    @required bool onlyWithMedia,
    @required bool onlyRemote,
    @required bool onlyLocal,
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
  }) : this(
          onlyWithMedia: onlyWithMedia,
          excludeReplies: null,
          excludeNsfwSensitive: null,
          onlyRemote: onlyRemote,
          onlyLocal: onlyLocal,
          withMuted: withMuted,
          excludeVisibilitiesStrings: excludeVisibilities
              ?.map((excludeVisibility) => excludeVisibility.toJsonValue())
              ?.toList(),
          onlyInRemoteList: null,
          withRemoteHashtag: null,
          timelineSettingsReplyVisibilityFilterString: null,
          onlyFromRemoteAccount: null,
          onlyPinned: null,
          excludeReblogs: null,
        );

  TimelineSettings.hashtag({
    @required bool onlyWithMedia,
    @required bool onlyLocal,
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
    @required IPleromaTag withRemoteHashtag,
  }) : this(
          onlyWithMedia: onlyWithMedia,
          excludeReplies: null,
          excludeNsfwSensitive: null,
          onlyRemote: null,
          onlyLocal: onlyLocal,
          withMuted: withMuted,
          excludeVisibilitiesStrings: excludeVisibilities
              ?.map((excludeVisibility) => excludeVisibility.toJsonValue())
              ?.toList(),
          onlyInRemoteList: null,
          withRemoteHashtag: withRemoteHashtag,
          timelineSettingsReplyVisibilityFilterString: null,
          onlyFromRemoteAccount: null,
          onlyPinned: null,
          excludeReblogs: null,
        );

  TimelineSettings.list({
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
    @required IPleromaList onlyInRemoteList,
  }) : this(
          onlyWithMedia: null,
          excludeReplies: null,
          excludeNsfwSensitive: null,
          onlyRemote: null,
          onlyLocal: null,
          withMuted: withMuted,
          excludeVisibilitiesStrings: excludeVisibilities
              ?.map((excludeVisibility) => excludeVisibility.toJsonValue())
              ?.toList(),
          onlyInRemoteList: onlyInRemoteList,
          withRemoteHashtag: null,
          timelineSettingsReplyVisibilityFilterString: null,
          onlyFromRemoteAccount: null,
          onlyPinned: null,
          excludeReblogs: null,
        );

  TimelineSettings.account({
    @required IPleromaAccount onlyFromRemoteAccount,
    @required bool onlyWithMedia,
    @required bool excludeReplies,
    @required bool excludeReblogs,
    @required bool onlyPinned,
  }) : this(
          onlyWithMedia: onlyWithMedia,
          excludeReplies: excludeReplies,
          excludeNsfwSensitive: null,
          onlyRemote: null,
          onlyLocal: null,
          withMuted: null,
          excludeVisibilitiesStrings: [],
          onlyInRemoteList: null,
          withRemoteHashtag: null,
          timelineSettingsReplyVisibilityFilterString: null,
          onlyFromRemoteAccount: onlyFromRemoteAccount,
          onlyPinned: onlyPinned,
          excludeReblogs: excludeReblogs,
        );

  TimelineSettings copyWith({
    bool onlyWithMedia,
    bool excludeReplies,
    bool excludeNsfwSensitive,
    bool onlyRemote,
    bool onlyLocal,
    bool withMuted,
    List<String> excludeVisibilitiesStrings,
    String typeString,
    PleromaList onlyInRemoteList,
    PleromaTag withRemoteHashtag,
    String timelineSettingsReplyVisibilityFilterString,
    PleromaAccount onlyFromRemoteAccount,
    bool excludeReblogs,
    bool onlyPinned,
  }) =>
      TimelineSettings(
        onlyWithMedia: onlyWithMedia ?? this.onlyWithMedia,
        excludeReplies: excludeReplies ?? this.excludeReplies,
        excludeNsfwSensitive: excludeNsfwSensitive ?? this.excludeNsfwSensitive,
        onlyRemote: onlyRemote ?? this.onlyRemote,
        onlyLocal: onlyLocal ?? this.onlyLocal,
        withMuted: withMuted ?? this.withMuted,
        excludeVisibilitiesStrings:
            excludeVisibilitiesStrings ?? this.excludeVisibilitiesStrings,
        onlyInRemoteList: onlyInRemoteList ?? this.onlyInRemoteList,
        withRemoteHashtag: withRemoteHashtag ?? this.withRemoteHashtag,
        timelineSettingsReplyVisibilityFilterString:
            timelineSettingsReplyVisibilityFilterString ??
                this.timelineSettingsReplyVisibilityFilterString,
        onlyFromRemoteAccount:
            onlyFromRemoteAccount ?? this.onlyFromRemoteAccount,
        excludeReblogs: excludeReblogs ?? this.excludeReblogs,
        onlyPinned: onlyPinned ?? this.onlyPinned,
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
          onlyInRemoteList == other.onlyInRemoteList &&
          withRemoteHashtag == other.withRemoteHashtag &&
          timelineSettingsReplyVisibilityFilterString ==
              other.timelineSettingsReplyVisibilityFilterString &&
          onlyFromRemoteAccount == other.onlyFromRemoteAccount &&
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
      onlyInRemoteList.hashCode ^
      withRemoteHashtag.hashCode ^
      timelineSettingsReplyVisibilityFilterString.hashCode ^
      onlyFromRemoteAccount.hashCode ^
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
        ' onlyInListWithRemoteId: $onlyInRemoteList,'
        ' withHashtag: $withRemoteHashtag,'
        ' timelineSettingsReplyVisibilityFilterString:'
        ' $timelineSettingsReplyVisibilityFilterString,'
        ' onlyFromAccountWithRemoteId: $onlyFromRemoteAccount,'
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

  List<PleromaVisibility> get excludeVisibilities => excludeVisibilitiesStrings
      ?.map((excludeVisibilityString) =>
          excludeVisibilityString.toPleromaVisibility())
      ?.toList();

  TimelineSettingsReplyVisibilityFilter
      get timelineSettingsReplyVisibilityFilter =>
          timelineSettingsReplyVisibilityFilterString
              ?.toTimelineSettingsReplyVisibilityFilter();

  static String generateUniqueTimelineId() =>
      "${DateTime.now().millisecondsSinceEpoch}";
}

enum TimelineSettingsReplyVisibilityFilter {
  following,
  self,
}

extension TimelineSettingsReplyVisibilityFilterExtension
    on TimelineSettingsReplyVisibilityFilter {
  String toJsonValue() {
    var filter =
        timelineSettingsReplyVisibilityFilterEnumValues.enumToValueMap[this];
    assert(filter != null, "invalid type $filter");
    return filter;
  }
}

extension TimelineSettingsReplyVisibilityFilterStringExtension on String {
  TimelineSettingsReplyVisibilityFilter
      toTimelineSettingsReplyVisibilityFilter() =>
          timelineSettingsReplyVisibilityFilterEnumValues.valueToEnumMap[this];
}

EnumValues<TimelineSettingsReplyVisibilityFilter>
    timelineSettingsReplyVisibilityFilterEnumValues = EnumValues({
  "following": TimelineSettingsReplyVisibilityFilter.following,
  "self": TimelineSettingsReplyVisibilityFilter.self,
});
