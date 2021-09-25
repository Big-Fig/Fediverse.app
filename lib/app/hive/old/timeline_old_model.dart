import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hive/old/timeline_settings_old_model.dart';
import 'package:fedi/app/timeline/type/timeline_type_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pleroma_api/pleroma_api.dart';

// ignore_for_file: no-magic-number
part 'timeline_old_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 78)
@JsonSerializable(explicitToJson: true)
class TimelineOld implements IJsonObj {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String? label;
  @HiveField(2)
  @JsonKey(name: 'is_possible_to_delete')
  final bool isPossibleToDelete;

  @HiveField(3)
  @JsonKey(name: 'type_string')
  final String typeString;

  TimelineType get type => typeString.toTimelineType();

  @HiveField(4)
  final TimelineSettingsOld settings;

  TimelineOld({
    required this.id,
    required this.typeString,
    required this.settings,
    required this.label,
    required this.isPossibleToDelete,
  });

  TimelineOld.byType({
    required String id,
    required TimelineType type,
    required TimelineSettingsOld settings,
    required String? label,
    required bool isPossibleToDelete,
  }) : this(
          id: id,
          typeString: type.toJsonValue(),
          settings: settings,
          label: label,
          isPossibleToDelete: isPossibleToDelete,
        );

  TimelineOld.home({
    required String id,
    required String? label,
    required TimelineSettingsOld settings,
    bool isPossibleToDelete = true,
  }) : this.byType(
          id: id,
          type: TimelineType.home,
          settings: settings,
          label: label,
          isPossibleToDelete: isPossibleToDelete,
        );

  TimelineOld.public({
    required String id,
    required TimelineSettingsOld settings,
    required String? label,
    bool isPossibleToDelete = true,
  }) : this.byType(
          id: id,
          type: TimelineType.public,
          settings: settings,
          label: label,
          isPossibleToDelete: isPossibleToDelete,
        );

  TimelineOld.hashtag({
    required IPleromaApiTag remoteTag,
    required TimelineSettingsOld settings,
    bool isPossibleToDelete = true,
  }) : this.byType(
          id: remoteTag.calculateTimelineId(),
          type: TimelineType.hashtag,
          settings: settings,
          label: remoteTag.name,
          isPossibleToDelete: isPossibleToDelete,
        );

  TimelineOld.customList({
    required IPleromaApiList remoteList,
    required TimelineSettingsOld settings,
    bool isPossibleToDelete = true,
  }) : this.byType(
          id: remoteList.calculateTimelineId(),
          type: TimelineType.customList,
          settings: settings,
          label: remoteList.title,
          isPossibleToDelete: isPossibleToDelete,
        );

  TimelineOld.account({
    required IPleromaApiAccount account,
    required TimelineSettingsOld settings,
    bool isPossibleToDelete = true,
  }) : this.byType(
          id: account.calculateTimelineId(),
          type: TimelineType.account,
          settings: settings,
          label: account.acct,
          isPossibleToDelete: isPossibleToDelete,
        );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimelineOld &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          label == other.label &&
          isPossibleToDelete == other.isPossibleToDelete &&
          typeString == other.typeString &&
          settings == other.settings;

  @override
  int get hashCode =>
      id.hashCode ^
      label.hashCode ^
      isPossibleToDelete.hashCode ^
      typeString.hashCode ^
      settings.hashCode;

  @override
  String toString() {
    return 'Timeline{id: $id, label: $label,'
        ' isPossibleToDelete: $isPossibleToDelete,'
        ' typeString: $typeString, settings: $settings}';
  }

  static TimelineOld fromJson(Map<String, dynamic> json) =>
      _$TimelineOldFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TimelineOldToJson(this);

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

  TimelineOld copyWith({
    String? id,
    TimelineType? type,
    TimelineSettingsOld? settings,
    String? label,
    bool? isPossibleToDelete,
  }) =>
      TimelineOld(
        id: id ?? this.id,
        typeString: type?.toJsonValue() ?? typeString,
        settings: settings ?? this.settings,
        label: label ?? this.label,
        isPossibleToDelete: isPossibleToDelete ?? this.isPossibleToDelete,
      );
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
