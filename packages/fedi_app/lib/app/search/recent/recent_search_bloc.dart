import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/search/recent/recent_search_model.dart';
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
