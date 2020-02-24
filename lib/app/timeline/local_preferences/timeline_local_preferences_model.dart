import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:hive/hive.dart';

part 'timeline_local_preferences_model.g.dart';

@HiveType()
class TimelineLocalPreferences extends IPreferencesObject {
  @HiveField(1)
  bool onlyMedia;
  @HiveField(2)
  bool noReplies;
  @HiveField(3)
  bool noNsfwSensitive;

  @override
  String toString() {
    return 'TimelineLocalPreferences{onlyMedia: $onlyMedia,'
        ' noReplies: $noReplies, noNsfwSensitive: $noNsfwSensitive}';
  }
}
