import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/app/search/input/search_input_bloc_impl.dart';
import 'package:fedi/app/search/search_bloc.dart';
import 'package:fedi/app/search/search_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger('search_bloc_impl.dart');

class SearchBloc extends DisposableOwner implements ISearchBloc {
  @override
  ISearchInputBloc searchInputBloc;

  IPleromaApiSearchService pleromaSearchService;

  SearchBloc({
    required this.pleromaSearchService,
    required SearchTab startTab,
    required String? initialQuery,
  })  : searchInputBloc = SearchInputBloc(
          initialQuery: initialQuery,
        ),
        _selectedTabSubject = BehaviorSubject.seeded(startTab) {
    addDisposable(searchInputBloc);
    _logger.finest(() => 'constructor');
    _selectedTabSubject.disposeWith(this);
  }

  // ignore: close_sinks
  final BehaviorSubject<SearchTab> _selectedTabSubject;

  @override
  Stream<SearchTab> get selectedTabStream => _selectedTabSubject.stream;

  @override
  SearchTab get selectedTab => _selectedTabSubject.value;

  @override
  void selectTab(SearchTab tab) {
    _selectedTabSubject.add(tab);
  }

  static SearchBloc createFromContext(
    BuildContext context, {
    required SearchTab startTab,
    required String? initialQuery,
  }) =>
      SearchBloc(
        startTab: startTab,
        initialQuery: initialQuery,
        pleromaSearchService: Provider.of<IPleromaApiSearchService>(
          context,
          listen: false,
        ),
      );
}
