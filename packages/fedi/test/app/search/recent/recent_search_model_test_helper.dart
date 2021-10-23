import 'package:fedi/app/search/recent/recent_search_model.dart';

// ignore_for_file: no-magic-number
class RecentSearchModelMockHelper {
  static RecentSearchList createTestRecentSearchList({
    required String seed,
  }) =>
      RecentSearchList(
        recentItems: [
          seed + '1',
          seed + '2',
        ],
      );
}
