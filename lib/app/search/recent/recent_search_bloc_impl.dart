import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/app/search/recent/recent_search_bloc.dart';
import 'package:fedi/app/search/recent/local_preferences/recent_search_local_preference_bloc.dart';
import 'package:fedi/app/search/recent/recent_search_model.dart';
import 'package:easy_dispose/easy_dispose.dart';

class RecentSearchBloc extends DisposableOwner implements IRecentSearchBloc {
  final ISearchInputBloc searchInputBloc;
  final IRecentSearchLocalPreferenceBloc recentSearchLocalPreferenceBloc;
  final int recentCountLimit;

  @override
  RecentSearchList? get recentSearchList =>
      recentSearchLocalPreferenceBloc.value;

  @override
  Stream<RecentSearchList?> get recentSearchListStream =>
      recentSearchLocalPreferenceBloc.stream;

  @override
  void searchAgain(String recentItem) {
    searchInputBloc.customSearch(recentItem);
  }

  RecentSearchBloc({
    // ignore: no-magic-number
    this.recentCountLimit = 20,
    required this.searchInputBloc,
    required this.recentSearchLocalPreferenceBloc,
  }) {
    searchInputBloc.confirmedSearchTermStream.listen(
      (confirmedSearchTerm) {
        var oldValue = recentSearchList ?? RecentSearchList(recentItems: []);

        var recentItems = oldValue.recentItems;
        if (recentItems.length > recentCountLimit) {
          recentItems = recentItems
              .sublist(
                0,
                recentCountLimit,
              )
              .toList();
        }

        if (confirmedSearchTerm.isNotEmpty) {
          if (!recentItems.contains(confirmedSearchTerm)) {
            recentItems.add(confirmedSearchTerm);
          }
        }

        recentSearchLocalPreferenceBloc.setValue(
          RecentSearchList(
            recentItems: recentItems,
          ),
        );
      },
    ).disposeWith(this);
  }

  @override
  void clearRecentSearch() {
    recentSearchLocalPreferenceBloc.setValue(RecentSearchList(recentItems: []));
  }
}
