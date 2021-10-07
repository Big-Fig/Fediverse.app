import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timelines_home_tab_storage_model.freezed.dart';

// ignore_for_file: no-magic-number
part 'timelines_home_tab_storage_model.g.dart';

enum TimelinesHomeTabStorageUiState { edit, view }

@freezed
class TimelinesHomeTabStorageListItem with _$TimelinesHomeTabStorageListItem {
  const factory TimelinesHomeTabStorageListItem({
    required Timeline timeline,
    required Key key,
  }) = _TimelinesHomeTabStorageListItem;

  static TimelinesHomeTabStorageListItem fromTimelineOnly({
    required Timeline timeline,
  }) =>
      TimelinesHomeTabStorageListItem(
        timeline: timeline,
        key: ValueKey('timeline.${timeline.id}'),
      );
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 81)
@freezed
class TimelinesHomeTabStorage
    with _$TimelinesHomeTabStorage
    implements IJsonObj {
  const factory TimelinesHomeTabStorage({
    @HiveField(0)
    @JsonKey(name: 'timeline_ids')
        required List<String> timelineIds,
  }) = _TimelinesHomeTabStorage;

  factory TimelinesHomeTabStorage.fromJson(Map<String, dynamic> json) =>
      _$TimelinesHomeTabStorageFromJson(json);
}
