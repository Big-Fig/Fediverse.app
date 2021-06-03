import 'package:fedi/app/search/recent/recent_search_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IRecentSearchBloc extends IDisposable {
  static IRecentSearchBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IRecentSearchBloc>(context, listen: listen);

  RecentSearchList? get recentSearchList;

  Stream<RecentSearchList?> get recentSearchListStream;

  void clearRecentSearch();

  void searchAgain(String recentItem);
}
