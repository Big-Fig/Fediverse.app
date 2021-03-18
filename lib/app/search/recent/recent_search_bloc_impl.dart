import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/app/search/recent/recent_search_bloc.dart';
import 'package:fedi/app/search/recent/recent_search_local_preference_bloc.dart';
import 'package:fedi/app/search/recent/recent_search_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';

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
    this.recentCountLimit = 20,
    required this.searchInputBloc,
    required this.recentSearchLocalPreferenceBloc,
  }) {
    addDisposable(
      streamSubscription: searchInputBloc.confirmedSearchTermStream.listen(
        (confirmedSearchTerm) {
          var oldValue = recentSearchList ?? RecentSearchList(recentItems: []);

          var recentItems = oldValue.recentItems!;
          if (recentItems.length > recentCountLimit) {
            recentItems = recentItems.sublist(0, recentCountLimit);
          }

          if (confirmedSearchTerm.isNotEmpty == true) {
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
      ),
    );
  }

  @override
  void clearRecentSearch() {
    recentSearchLocalPreferenceBloc.setValue(RecentSearchList(recentItems: []));
  }
}
