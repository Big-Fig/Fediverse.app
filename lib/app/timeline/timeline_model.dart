import 'dart:convert';

import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/app/timeline/type/timeline_type_model.dart';
import 'package:fedi/json/json_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/list/pleroma_list_model.dart';
import 'package:fedi/pleroma/tag/pleroma_tag_model.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timeline_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 78)
@JsonSerializable(explicitToJson: true)
class Timeline implements IJsonObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String label;
  @HiveField(2)
  @JsonKey(name: "is_possible_to_delete")
  final bool isPossibleToDelete;

  @HiveField(3)
  @JsonKey(name: "type_string")
  final String typeString;

  TimelineType get type => typeString?.toTimelineType();

  @HiveField(4)
  final TimelineSettings settings;

  Timeline({
    @required this.id,
    @required this.typeString,
    @required this.settings,
    @required this.label,
    @required this.isPossibleToDelete,
  });

  Timeline.byType({
    @required String id,
    @required TimelineType type,
    @required TimelineSettings settings,
    @required String label,
    @required bool isPossibleToDelete,
  }) : this(
          id: id,
          typeString: type.toJsonValue(),
          settings: settings,
          label: label,
          isPossibleToDelete: isPossibleToDelete,
        );

  Timeline.home({
    @required String id,
    @required String label,
    @required TimelineSettings settings,
    bool isPossibleToDelete = true,
  }) : this.byType(
          id: id,
          type: TimelineType.home,
          settings: settings,
          label: label,
          isPossibleToDelete: isPossibleToDelete,
        );

  Timeline.public({
    @required String id,
    @required TimelineSettings settings,
    @required String label,
    bool isPossibleToDelete = true,
  }) : this.byType(
          id: id,
          type: TimelineType.public,
          settings: settings,
          label: label,
          isPossibleToDelete: isPossibleToDelete,
        );

  Timeline.hashtag({
    @required IPleromaTag remoteTag,
    @required TimelineSettings settings,
    bool isPossibleToDelete = true,
  }) : this.byType(
          id: remoteTag.calculateTimelineId(),
          type: TimelineType.hashtag,
          settings: settings,
          label: remoteTag.name,
          isPossibleToDelete: isPossibleToDelete,
        );

  Timeline.customList({
    @required IPleromaList remoteList,
    @required TimelineSettings settings,
    bool isPossibleToDelete = true,
  }) : this.byType(
          id: remoteList.calculateTimelineId(),
          type: TimelineType.customList,
          settings: settings,
          label: remoteList.title,
          isPossibleToDelete: isPossibleToDelete,
        );

  Timeline.account({
    @required IPleromaAccount account,
    @required TimelineSettings settings,
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
      other is Timeline &&
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

  factory Timeline.fromJson(Map<String, dynamic> json) =>
      _$TimelineFromJson(json);

  factory Timeline.fromJsonString(String jsonString) =>
      _$TimelineFromJson(jsonDecode(jsonString));

  static List<Timeline> listFromJsonString(String str) =>
      List<Timeline>.from(json.decode(str).map((x) => Timeline.fromJson(x)));

  @override
  Map<String, dynamic> toJson() => _$TimelineToJson(this);

  String toJsonString() => jsonEncode(_$TimelineToJson(this));

  bool get onlyWithMedia => settings?.onlyWithMedia;

  bool get excludeReplies => settings?.excludeReplies;

  bool get excludeNsfwSensitive => settings?.excludeNsfwSensitive;

  bool get onlyRemote => settings?.onlyRemote;

  bool get onlyLocal => settings?.onlyLocal;

  bool get isWebSocketsUpdatesEnabled => settings?.webSocketsUpdates;

  bool get withMuted => settings?.withMuted;

  List<String> get excludeVisibilitiesStrings =>
      settings?.excludeVisibilitiesStrings;

  List<PleromaVisibility> get excludeVisibilities =>
      settings?.excludeVisibilities;

  PleromaList get onlyInRemoteList => settings?.onlyInRemoteList;

  String get withRemoteHashtag => settings?.withRemoteHashtag;

  String get PleromaReplyVisibilityFilterString =>
      settings?.replyVisibilityFilterString;

  PleromaReplyVisibilityFilter get replyVisibilityFilter =>
      settings?.replyVisibilityFilter;

  PleromaAccount get onlyFromRemoteAccount => settings?.onlyFromRemoteAccount;

  String get onlyFromInstance => settings?.onlyFromInstance;

  bool get onlyPinned => settings?.onlyPinned;

  bool get excludeReblogs => settings?.excludeReblogs;

  Timeline copyWith({
    String id,
    TimelineType type,
    TimelineSettings settings,
    String label,
    bool isPossibleToDelete,
  }) =>
      Timeline(
        id: id ?? this.id,
        typeString: type?.toJsonValue() ?? typeString,
        settings: settings ?? this.settings,
        label: label ?? this.label,
        isPossibleToDelete: isPossibleToDelete ?? this.isPossibleToDelete,
      );
}

extension TimelineIdPleromaListExtension on IPleromaList {
  String calculateTimelineId() => "list.$id";
}

extension TimelineIdPleromaTagExtension on IPleromaTag {
  String calculateTimelineId() => "hashtag.$name";
}

extension TimelineIdPleromaAccountExtension on IPleromaAccount {
  String calculateTimelineId() => "account.$id";
}

extension TimelineIdCustomListExtension on ICustomList {
  String calculateTimelineId() => "list.$remoteId";
}

extension TimelineIdHashTagExtension on IHashtag {
  String calculateTimelineId() => "hashtag.$name";
}

extension TimelineIdAccountExtension on IAccount {
  String calculateTimelineId() => "account.$remoteId";
}
