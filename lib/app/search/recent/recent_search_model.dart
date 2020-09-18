import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:hive/hive.dart';

part 'recent_search_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
@HiveType()
// @HiveType(typeId: -32 + 65)
class RecentSearchList implements IPreferencesObject {
  @HiveField(0)
  final List<String> recentItems;
  RecentSearchList({this.recentItems});

  @override
  String toString() {
    return 'RecentSearchList{recentItems: $recentItems}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentSearchList &&
          runtimeType == other.runtimeType &&
          recentItems == other.recentItems;
  @override
  int get hashCode => recentItems.hashCode;
}
