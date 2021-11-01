import 'package:fedi_app/app/settings/settings_model.dart';
import 'package:fedi_app/app/timeline/type/timeline_type_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'timeline_settings_model.freezed.dart';

// ignore_for_file: no-magic-number
part 'timeline_settings_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 117)
@freezed
class TimelineSettings
    with _$TimelineSettings
    implements ISettings<TimelineSettings> {
  static TimelineSettings createDefaultPublicSettings() =>
      TimelineSettings.public(
        onlyWithMedia: false,
        onlyRemote: false,
        onlyLocal: false,
        withMuted: false,
        excludeVisibilities: [],
        webSocketsUpdates: true,
        onlyFromInstance: null,
      );

  static TimelineSettings createDefaultHomeSettings() => TimelineSettings.home(
        onlyLocal: false,
        withMuted: false,
        excludeVisibilities: [],
        webSocketsUpdates: true,
      );

  static TimelineSettings createDefaultCustomListSettings({
    required IUnifediApiList? onlyInRemoteList,
  }) =>
      TimelineSettings.list(
        withMuted: null,
        excludeVisibilities: null,
        onlyInRemoteList: onlyInRemoteList,
        webSocketsUpdates: true,
      );

  static TimelineSettings createDefaultHashtagSettings({
    required String? withRemoteHashtag,
  }) =>
      TimelineSettings.hashtag(
        onlyWithMedia: null,
        onlyLocal: null,
        withMuted: null,
        excludeVisibilities: null,
        withRemoteHashtag: withRemoteHashtag,
        webSocketsUpdates: true,
      );

  static TimelineSettings createDefaultAccountSettings({
    required IUnifediApiAccount? onlyFromRemoteAccount,
  }) =>
      TimelineSettings.account(
        onlyWithMedia: null,
        excludeReblogs: null,
        excludeReplies: null,
        onlyPinned: null,
        onlyFromRemoteAccount: onlyFromRemoteAccount,
        webSocketsUpdates: true,
      );

  const TimelineSettings._();

  const factory TimelineSettings({
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
        required UnifediApiList? onlyInRemoteList,
    @HiveField(10)
    @JsonKey(name: 'with_remote_hashtag')
        required String? withRemoteHashtag,
    @HiveField(11)
    @JsonKey(name: 'reply_visibility_filter_string')
        required String? replyVisibilityFilterString,
    @HiveField(13)
    @JsonKey(name: 'only_from_remote_account')
        required UnifediApiAccount? onlyFromRemoteAccount,
    @HiveField(14) @JsonKey(name: 'only_pinned') required bool? onlyPinned,
    @HiveField(15)
    @JsonKey(name: 'exclude_reblogs')
        required bool? excludeReblogs,
    @HiveField(16)
    @JsonKey(name: 'web_sockets_updates')
        required bool? webSocketsUpdates,
    @HiveField(17) @JsonKey(name: 'instance') required String? onlyFromInstance,
  }) = _TimelineSettings;

  static TimelineSettings home({
    required bool onlyLocal,
    required bool withMuted,
    required List<UnifediApiVisibility> excludeVisibilities,
    required bool webSocketsUpdates,
  }) =>
      TimelineSettings(
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
        webSocketsUpdates: webSocketsUpdates,
        onlyFromInstance: null,
      );

  // ignore: long-parameter-list
  static TimelineSettings public({
    required bool onlyWithMedia,
    required bool onlyRemote,
    required bool onlyLocal,
    required bool withMuted,
    required List<UnifediApiVisibility> excludeVisibilities,
    required bool webSocketsUpdates,
    required String? onlyFromInstance,
  }) =>
      TimelineSettings(
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
        webSocketsUpdates: webSocketsUpdates,
        onlyFromInstance: onlyFromInstance,
      );

  static TimelineSettings hashtag({
    required bool? onlyWithMedia,
    required bool? onlyLocal,
    required bool? withMuted,
    required List<UnifediApiVisibility>? excludeVisibilities,
    required String? withRemoteHashtag,
    required bool webSocketsUpdates,
  }) =>
      TimelineSettings(
        onlyWithMedia: onlyWithMedia,
        excludeReplies: null,
        excludeNsfwSensitive: null,
        onlyRemote: null,
        onlyLocal: onlyLocal,
        withMuted: withMuted,
        excludeVisibilitiesStrings: excludeVisibilities
            ?.map((excludeVisibility) => excludeVisibility.stringValue)
            .toList(),
        onlyInRemoteList: null,
        withRemoteHashtag: withRemoteHashtag,
        replyVisibilityFilterString: null,
        onlyFromRemoteAccount: null,
        onlyPinned: null,
        excludeReblogs: null,
        webSocketsUpdates: webSocketsUpdates,
        onlyFromInstance: null,
      );

  static TimelineSettings list({
    required bool? withMuted,
    required List<UnifediApiVisibility>? excludeVisibilities,
    required IUnifediApiList? onlyInRemoteList,
    required bool webSocketsUpdates,
  }) =>
      TimelineSettings(
        onlyWithMedia: null,
        excludeReplies: null,
        excludeNsfwSensitive: null,
        onlyRemote: null,
        onlyLocal: null,
        withMuted: withMuted,
        excludeVisibilitiesStrings: excludeVisibilities
            ?.map((excludeVisibility) => excludeVisibility.stringValue)
            .toList(),
        onlyInRemoteList: onlyInRemoteList?.toUnifediApiList(),
        withRemoteHashtag: null,
        replyVisibilityFilterString: null,
        onlyFromRemoteAccount: null,
        onlyPinned: null,
        excludeReblogs: null,
        webSocketsUpdates: webSocketsUpdates,
        onlyFromInstance: null,
      );

  static TimelineSettings account({
    required IUnifediApiAccount? onlyFromRemoteAccount,
    required bool? onlyWithMedia,
    required bool? excludeReplies,
    required bool? excludeReblogs,
    required bool? onlyPinned,
    required bool webSocketsUpdates,
  }) =>
      TimelineSettings(
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
        onlyFromRemoteAccount: onlyFromRemoteAccount?.toUnifediApiAccount(),
        onlyPinned: onlyPinned,
        excludeReblogs: excludeReblogs,
        webSocketsUpdates: webSocketsUpdates,
        onlyFromInstance: null,
      );

  factory TimelineSettings.fromJson(Map<String, dynamic> json) =>
      _$TimelineSettingsFromJson(json);

  List<UnifediApiVisibility>? get excludeVisibilities =>
      excludeVisibilitiesStrings
          ?.map(
            (excludeVisibilityString) =>
                excludeVisibilityString.toUnifediApiVisibility(),
          )
          .toList();

  UnifediApiReplyVisibilityFilter? get replyVisibilityFilter =>
      replyVisibilityFilterString?.toUnifediApiReplyVisibilityFilter();

  static TimelineSettings createDefaultSettings(TimelineType timelineType) {
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
