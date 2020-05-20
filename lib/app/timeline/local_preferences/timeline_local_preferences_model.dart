import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:hive/hive.dart';

part 'timeline_local_preferences_model.g.dart';

@HiveType()
class TimelineLocalPreferences extends IPreferencesObject {
  @HiveField(1)
  bool onlyWithMedia;
  @HiveField(2)
  bool onlyNoReplies;
  @HiveField(3)
  bool onlyNoNsfwSensitive;

  TimelineLocalPreferences(
      {this.onlyWithMedia, this.onlyNoReplies, this.onlyNoNsfwSensitive});

  TimelineLocalPreferences copyWith(
      {bool onlyWithMedia, bool onlyNoReplies, bool onlyNoNsfwSensitive}) {
    return TimelineLocalPreferences(
      onlyWithMedia: onlyWithMedia ?? this.onlyWithMedia,
      onlyNoReplies: onlyNoReplies ?? this.onlyNoReplies,
      onlyNoNsfwSensitive: onlyNoNsfwSensitive ?? this.onlyNoNsfwSensitive,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimelineLocalPreferences &&
          runtimeType == other.runtimeType &&
          onlyWithMedia == other.onlyWithMedia &&
          onlyNoReplies == other.onlyNoReplies &&
          onlyNoNsfwSensitive == other.onlyNoNsfwSensitive;

  @override
  int get hashCode =>
      onlyWithMedia.hashCode ^
      onlyNoReplies.hashCode ^
      onlyNoNsfwSensitive.hashCode;

  @override
  String toString() {
    return 'TimelineLocalPreferences{onlyWithMedia: $onlyWithMedia,'
        ' onlyNoReplies: $onlyNoReplies, onlyNoNsfwSensitive: $onlyNoNsfwSensitive}';
  }
}
