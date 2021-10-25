import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/custom_list/custom_list_model.dart';
import 'package:fedi_app/app/hashtag/hashtag_model.dart';
import 'package:fedi_app/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi_app/app/timeline/type/timeline_type_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'timeline_model.freezed.dart';

// ignore_for_file: no-magic-number
part 'timeline_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 116)
@freezed
class Timeline with _$Timeline implements IJsonObj {
  TimelineType get type => typeString.toTimelineType();

  const Timeline._();

  const factory Timeline({
    @HiveField(0) required String id,
    @HiveField(1) required String? label,
    @HiveField(2)
    @JsonKey(name: 'is_possible_to_delete')
        required bool isPossibleToDelete,
    @HiveField(3) @JsonKey(name: 'type_string') required String typeString,
    @HiveField(4) required TimelineSettings settings,
  }) = _Timeline;

  static Timeline byType({
    required String id,
    required TimelineType type,
    required TimelineSettings settings,
    required String? label,
    required bool isPossibleToDelete,
  }) =>
      Timeline(
        id: id,
        typeString: type.toJsonValue(),
        settings: settings,
        label: label,
        isPossibleToDelete: isPossibleToDelete,
      );

  static Timeline home({
    required String id,
    required String? label,
    required TimelineSettings settings,
    bool isPossibleToDelete = true,
  }) =>
      Timeline.byType(
        id: id,
        type: TimelineType.home,
        settings: settings,
        label: label,
        isPossibleToDelete: isPossibleToDelete,
      );

  static Timeline public({
    required String id,
    required TimelineSettings settings,
    required String? label,
    bool isPossibleToDelete = true,
  }) =>
      Timeline.byType(
        id: id,
        type: TimelineType.public,
        settings: settings,
        label: label,
        isPossibleToDelete: isPossibleToDelete,
      );

  static Timeline hashtag({
    required IUnifediApiTag remoteTag,
    required TimelineSettings settings,
    bool isPossibleToDelete = true,
  }) =>
      Timeline.byType(
        id: remoteTag.calculateTimelineId(),
        type: TimelineType.hashtag,
        settings: settings,
        label: remoteTag.name,
        isPossibleToDelete: isPossibleToDelete,
      );

  static Timeline customList({
    required IUnifediApiList remoteList,
    required TimelineSettings settings,
    bool isPossibleToDelete = true,
  }) =>
      Timeline.byType(
        id: remoteList.calculateTimelineId(),
        type: TimelineType.customList,
        settings: settings,
        label: remoteList.title,
        isPossibleToDelete: isPossibleToDelete,
      );

  static Timeline account({
    required IUnifediApiAccount account,
    required TimelineSettings settings,
    bool isPossibleToDelete = true,
  }) =>
      Timeline.byType(
        id: account.calculateTimelineId(),
        type: TimelineType.account,
        settings: settings,
        label: account.acct,
        isPossibleToDelete: isPossibleToDelete,
      );

  factory Timeline.fromJson(Map<String, dynamic> json) =>
      _$TimelineFromJson(json);

  bool? get onlyWithMedia => settings.onlyWithMedia;

  bool? get excludeReplies => settings.excludeReplies;

  bool? get excludeNsfwSensitive => settings.excludeNsfwSensitive;

  bool? get onlyRemote => settings.onlyRemote;

  bool? get onlyLocal => settings.onlyLocal;

  bool? get isWebSocketsUpdatesEnabled => settings.webSocketsUpdates;

  bool? get withMuted => settings.withMuted;

  List<String?>? get excludeVisibilitiesStrings =>
      settings.excludeVisibilitiesStrings;

  List<UnifediApiVisibility>? get excludeVisibilities =>
      settings.excludeVisibilities;

  UnifediApiList? get onlyInRemoteList => settings.onlyInRemoteList;

  String? get withRemoteHashtag => settings.withRemoteHashtag;

  String? get unifediApiReplyVisibilityFilterString =>
      settings.replyVisibilityFilterString;

  UnifediApiReplyVisibilityFilter? get replyVisibilityFilter =>
      settings.replyVisibilityFilter;

  UnifediApiAccount? get onlyFromRemoteAccount =>
      settings.onlyFromRemoteAccount;

  String? get onlyFromInstance => settings.onlyFromInstance;

  bool? get onlyPinned => settings.onlyPinned;

  bool? get excludeReblogs => settings.excludeReblogs;
}

extension TimelineIdUnifediListExtension on IUnifediApiList {
  String calculateTimelineId() => 'list.$id';
}

extension TimelineIdUnifediTagExtension on IUnifediApiTag {
  String calculateTimelineId() => 'hashtag.$name';
}

extension TimelineIdUnifediApiAccountExtension on IUnifediApiAccount {
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
