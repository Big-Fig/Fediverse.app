import 'package:fedi_app/app/settings/settings_model.dart';
import 'package:fedi_app/app/timeline/type/timeline_type_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pleroma_api/pleroma_api.dart';

part 'timeline_settings_old_model.freezed.dart';

// ignore_for_file: no-magic-number
part 'timeline_settings_old_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 79)
@freezed
class TimelineSettingsOld
    with _$TimelineSettingsOld
    implements ISettings<TimelineSettingsOld> {
  const TimelineSettingsOld._();

  const factory TimelineSettingsOld({
    @HiveField(1)
    @JsonKey(name: 'only_with_media')
        required bool? onlyWithMedia,
    @HiveField(2)
    @JsonKey(name: 'exclude_replies')
        required bool? excludeReplies,
    @HiveField(3)
    @JsonKey(name: 'exclude_nsfw_sensitive')
        required bool? excludeNsfwSensitive,
    @HiveField(4) @JsonKey(name: 'only_remote') required bool? onlyRemote,
    @HiveField(5) @JsonKey(name: 'only_local') required bool? onlyLocal,
    @HiveField(6) @JsonKey(name: 'with_muted') required bool? withMuted,
    @HiveField(7)
    @JsonKey(name: 'exclude_visibilities_strings')
        required List<String>? excludeVisibilitiesStrings,
    @HiveField(9)
    @JsonKey(name: 'only_in_list')
        required PleromaApiList? onlyInRemoteList,
    @HiveField(10)
    @JsonKey(name: 'with_remote_hashtag')
        required String? withRemoteHashtag,
    @HiveField(11)
    @JsonKey(name: 'reply_visibility_filter_string')
        required String? replyVisibilityFilterString,
    @HiveField(13)
    @JsonKey(name: 'only_from_remote_account')
        required PleromaApiAccount? onlyFromRemoteAccount,
    @HiveField(14) @JsonKey(name: 'only_pinned') required bool? onlyPinned,
    @HiveField(15)
    @JsonKey(name: 'exclude_reblogs')
        required bool? excludeReblogs,
    @HiveField(16)
    @JsonKey(name: 'web_sockets_updates')
        required bool? webSocketsUpdates,
    @HiveField(17) @JsonKey(name: 'instance') required String? onlyFromInstance,
  }) = _TimelineSettingsOld;

  static TimelineSettingsOld createDefaultPublicSettings() =>
      TimelineSettingsOld.public(
        onlyWithMedia: false,
        onlyRemote: false,
        onlyLocal: false,
        withMuted: false,
        excludeVisibilities: [],
        websocketsUpdates: true,
        onlyFromInstance: null,
      );

  static TimelineSettingsOld createDefaultHomeSettings() =>
      TimelineSettingsOld.home(
        onlyLocal: false,
        withMuted: false,
        excludeVisibilities: [],
        websocketsUpdates: true,
      );

  static TimelineSettingsOld createDefaultCustomListSettings({
    required IPleromaApiList? onlyInRemoteList,
  }) =>
      TimelineSettingsOld.list(
        withMuted: false,
        excludeVisibilities: [],
        onlyInRemoteList: onlyInRemoteList,
        websocketsUpdates: true,
      );

  static TimelineSettingsOld createDefaultHashtagSettings({
    required String? withRemoteHashtag,
  }) =>
      TimelineSettingsOld.hashtag(
        onlyWithMedia: false,
        onlyLocal: false,
        withMuted: false,
        excludeVisibilities: [],
        withRemoteHashtag: withRemoteHashtag,
        websocketsUpdates: true,
      );

  static TimelineSettingsOld createDefaultAccountSettings({
    required IPleromaApiAccount? onlyFromRemoteAccount,
  }) =>
      TimelineSettingsOld.account(
        onlyWithMedia: false,
        excludeReblogs: false,
        excludeReplies: false,
        onlyPinned: false,
        onlyFromRemoteAccount: onlyFromRemoteAccount,
        websocketsUpdates: true,
      );

  static TimelineSettingsOld home({
    required bool onlyLocal,
    required bool withMuted,
    required List<PleromaApiVisibility> excludeVisibilities,
    required bool websocketsUpdates,
  }) =>
      TimelineSettingsOld(
        onlyWithMedia: null,
        excludeReplies: null,
        excludeNsfwSensitive: null,
        onlyRemote: null,
        onlyLocal: onlyLocal,
        withMuted: withMuted,
        excludeVisibilitiesStrings: excludeVisibilities
            .map((excludeVisibility) => excludeVisibility.stringValue)
            .toList(),
        onlyInRemoteList: null,
        withRemoteHashtag: null,
        replyVisibilityFilterString: null,
        onlyFromRemoteAccount: null,
        onlyPinned: null,
        excludeReblogs: null,
        webSocketsUpdates: websocketsUpdates,
        onlyFromInstance: null,
      );

  // ignore: long-parameter-list
  static TimelineSettingsOld public({
    required bool onlyWithMedia,
    required bool onlyRemote,
    required bool onlyLocal,
    required bool withMuted,
    required List<PleromaApiVisibility> excludeVisibilities,
    required bool websocketsUpdates,
    required String? onlyFromInstance,
  }) =>
      TimelineSettingsOld(
        onlyWithMedia: onlyWithMedia,
        excludeReplies: null,
        excludeNsfwSensitive: null,
        onlyRemote: onlyRemote,
        onlyLocal: onlyLocal,
        withMuted: withMuted,
        excludeVisibilitiesStrings: excludeVisibilities
            .map((excludeVisibility) => excludeVisibility.stringValue)
            .toList(),
        onlyInRemoteList: null,
        withRemoteHashtag: null,
        replyVisibilityFilterString: null,
        onlyFromRemoteAccount: null,
        onlyPinned: null,
        excludeReblogs: null,
        webSocketsUpdates: websocketsUpdates,
        onlyFromInstance: onlyFromInstance,
      );

  static TimelineSettingsOld hashtag({
    required bool onlyWithMedia,
    required bool onlyLocal,
    required bool withMuted,
    required List<PleromaApiVisibility> excludeVisibilities,
    required String? withRemoteHashtag,
    required bool websocketsUpdates,
  }) =>
      TimelineSettingsOld(
        onlyWithMedia: onlyWithMedia,
        excludeReplies: null,
        excludeNsfwSensitive: null,
        onlyRemote: null,
        onlyLocal: onlyLocal,
        withMuted: withMuted,
        excludeVisibilitiesStrings: excludeVisibilities
            .map((excludeVisibility) => excludeVisibility.stringValue)
            .toList(),
        onlyInRemoteList: null,
        withRemoteHashtag: withRemoteHashtag,
        replyVisibilityFilterString: null,
        onlyFromRemoteAccount: null,
        onlyPinned: null,
        excludeReblogs: null,
        webSocketsUpdates: websocketsUpdates,
        onlyFromInstance: null,
      );

  static TimelineSettingsOld list({
    required bool withMuted,
    required List<PleromaApiVisibility> excludeVisibilities,
    required IPleromaApiList? onlyInRemoteList,
    required bool websocketsUpdates,
  }) =>
      TimelineSettingsOld(
        onlyWithMedia: null,
        excludeReplies: null,
        excludeNsfwSensitive: null,
        onlyRemote: null,
        onlyLocal: null,
        withMuted: withMuted,
        excludeVisibilitiesStrings: excludeVisibilities
            .map((excludeVisibility) => excludeVisibility.stringValue)
            .toList(),
        onlyInRemoteList: onlyInRemoteList?.toPleromaApiList(),
        withRemoteHashtag: null,
        replyVisibilityFilterString: null,
        onlyFromRemoteAccount: null,
        onlyPinned: null,
        excludeReblogs: null,
        webSocketsUpdates: websocketsUpdates,
        onlyFromInstance: null,
      );

  static TimelineSettingsOld account({
    required IPleromaApiAccount? onlyFromRemoteAccount,
    required bool onlyWithMedia,
    required bool excludeReplies,
    required bool excludeReblogs,
    required bool onlyPinned,
    required bool websocketsUpdates,
  }) =>
      TimelineSettingsOld(
        onlyWithMedia: onlyWithMedia,
        excludeReplies: excludeReplies,
        excludeNsfwSensitive: null,
        onlyRemote: null,
        onlyLocal: null,
        withMuted: null,
        excludeVisibilitiesStrings: [],
        onlyInRemoteList: null,
        withRemoteHashtag: null,
        replyVisibilityFilterString: null,
        onlyFromRemoteAccount: onlyFromRemoteAccount?.toPleromaApiAccount(),
        onlyPinned: onlyPinned,
        excludeReblogs: excludeReblogs,
        webSocketsUpdates: websocketsUpdates,
        onlyFromInstance: null,
      );

  factory TimelineSettingsOld.fromJson(Map<String, dynamic> json) =>
      _$TimelineSettingsOldFromJson(json);

  List<PleromaApiVisibility>? get excludeVisibilities =>
      excludeVisibilitiesStrings
          ?.map(
            (excludeVisibilityString) =>
                excludeVisibilityString.toPleromaApiVisibility(),
          )
          .toList();

  PleromaApiReplyVisibilityFilter? get replyVisibilityFilter =>
      replyVisibilityFilterString?.toPleromaApiReplyVisibilityFilter();

  static TimelineSettingsOld createDefaultSettings(TimelineType timelineType) {
    switch (timelineType) {
      case TimelineType.public:
        return createDefaultPublicSettings();
      case TimelineType.customList:
        return createDefaultCustomListSettings(onlyInRemoteList: null);
      case TimelineType.home:
        return createDefaultHomeSettings();
      case TimelineType.hashtag:
        return createDefaultHashtagSettings(withRemoteHashtag: null);
      case TimelineType.account:
        return createDefaultAccountSettings(onlyFromRemoteAccount: null);
    }
  }
}
