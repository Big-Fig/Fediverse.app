import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/custom_list/custom_list_model.dart';
import 'package:fedi_app/app/hashtag/hashtag_model.dart';
import 'package:fedi_app/app/hive/old/timeline_settings_old_model.dart';
import 'package:fedi_app/app/timeline/type/timeline_type_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pleroma_api/pleroma_api.dart';

part 'timeline_old_model.freezed.dart';

// ignore_for_file: no-magic-number
part 'timeline_old_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 78)
@freezed
class TimelineOld with _$TimelineOld implements IJsonObj {
  TimelineType get type => typeString.toTimelineType();

  const TimelineOld._();

  const factory TimelineOld({
    @HiveField(0) required String id,
    @HiveField(1) required String? label,
    @HiveField(2)
    @JsonKey(name: 'is_possible_to_delete')
        required bool isPossibleToDelete,
    @HiveField(3) @JsonKey(name: 'type_string') required String typeString,
    @HiveField(4) required TimelineSettingsOld settings,
  }) = _TimelineOld;

  static TimelineOld byType({
    required String id,
    required TimelineType type,
    required TimelineSettingsOld settings,
    required String? label,
    required bool isPossibleToDelete,
  }) =>
      TimelineOld(
        id: id,
        typeString: type.toJsonValue(),
        settings: settings,
        label: label,
        isPossibleToDelete: isPossibleToDelete,
      );

  static TimelineOld home({
    required String id,
    required String? label,
    required TimelineSettingsOld settings,
    bool isPossibleToDelete = true,
  }) =>
      TimelineOld.byType(
        id: id,
        type: TimelineType.home,
        settings: settings,
        label: label,
        isPossibleToDelete: isPossibleToDelete,
      );

  static TimelineOld public({
    required String id,
    required TimelineSettingsOld settings,
    required String? label,
    bool isPossibleToDelete = true,
  }) =>
      TimelineOld.byType(
        id: id,
        type: TimelineType.public,
        settings: settings,
        label: label,
        isPossibleToDelete: isPossibleToDelete,
      );

  static TimelineOld hashtag({
    required IPleromaApiTag remoteTag,
    required TimelineSettingsOld settings,
    bool isPossibleToDelete = true,
  }) =>
      TimelineOld.byType(
        id: remoteTag.calculateTimelineId(),
        type: TimelineType.hashtag,
        settings: settings,
        label: remoteTag.name,
        isPossibleToDelete: isPossibleToDelete,
      );

  static TimelineOld customList({
    required IPleromaApiList remoteList,
    required TimelineSettingsOld settings,
    bool isPossibleToDelete = true,
  }) =>
      TimelineOld.byType(
        id: remoteList.calculateTimelineId(),
        type: TimelineType.customList,
        settings: settings,
        label: remoteList.title,
        isPossibleToDelete: isPossibleToDelete,
      );

  static TimelineOld account({
    required IPleromaApiAccount account,
    required TimelineSettingsOld settings,
    bool isPossibleToDelete = true,
  }) =>
      TimelineOld.byType(
        id: account.calculateTimelineId(),
        type: TimelineType.account,
        settings: settings,
        label: account.acct,
        isPossibleToDelete: isPossibleToDelete,
      );

  factory TimelineOld.fromJson(Map<String, dynamic> json) =>
      _$TimelineOldFromJson(json);

  bool? get onlyWithMedia => settings.onlyWithMedia;

  bool? get excludeReplies => settings.excludeReplies;

  bool? get excludeNsfwSensitive => settings.excludeNsfwSensitive;

  bool? get onlyRemote => settings.onlyRemote;

  bool? get onlyLocal => settings.onlyLocal;

  bool? get isWebSocketsUpdatesEnabled => settings.webSocketsUpdates;

  bool? get withMuted => settings.withMuted;

  List<String?>? get excludeVisibilitiesStrings =>
      settings.excludeVisibilitiesStrings;

  List<PleromaApiVisibility>? get excludeVisibilities =>
      settings.excludeVisibilities;

  PleromaApiList? get onlyInRemoteList => settings.onlyInRemoteList;

  String? get withRemoteHashtag => settings.withRemoteHashtag;

  String? get pleromaApiReplyVisibilityFilterString =>
      settings.replyVisibilityFilterString;

  PleromaApiReplyVisibilityFilter? get replyVisibilityFilter =>
      settings.replyVisibilityFilter;

  PleromaApiAccount? get onlyFromRemoteAccount =>
      settings.onlyFromRemoteAccount;

  String? get onlyFromInstance => settings.onlyFromInstance;

  bool? get onlyPinned => settings.onlyPinned;

  bool? get excludeReblogs => settings.excludeReblogs;
}

extension TimelineIdPleromaListExtension on IPleromaApiList {
  String calculateTimelineId() => 'list.$id';
}

extension TimelineIdPleromaTagExtension on IPleromaApiTag {
  String calculateTimelineId() => 'hashtag.$name';
}

extension TimelineIdPleromaApiAccountExtension on IPleromaApiAccount {
  String calculateTimelineId() => 'account.$id';
}

extension TimelineIdCustomListExtension on ICustomList {
  String calculateTimelineId() => 'list.$remoteId';
}

extension TimelineIdHashTagExtension on IHashtag {
  String calculateTimelineId() => 'hashtag.$name';
}

extension TimelineIdAccountExtension on IAccount {
  String calculateTimelineId() => 'account.$remoteId';
}
