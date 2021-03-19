import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/app/search/input/search_input_bloc_impl.dart';
import 'package:fedi/app/search/search_bloc.dart';
import 'package:fedi/app/search/search_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/search/pleroma_search_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("search_bloc_impl.dart");

class SearchBloc extends DisposableOwner implements ISearchBloc {
  @override
  ISearchInputBloc searchInputBloc;

  IPleromaSearchService pleromaSearchService;

  SearchBloc({
    required this.pleromaSearchService,
    required SearchTab startTab,
  })   : searchInputBloc = SearchInputBloc(),
        _selectedTabSubject = BehaviorSubject.seeded(startTab) {
    addDisposable(disposable: searchInputBloc);
    _logger.finest(() => "constructor");
    addDisposable(subject: _selectedTabSubject);
  }

  // ignore: close_sinks
  final BehaviorSubject<SearchTab> _selectedTabSubject;

  @override
  Stream<SearchTab> get selectedTabStream => _selectedTabSubject.stream;

  @override
  SearchTab get selectedTab => _selectedTabSubject.value!;

  @override
  void selectTab(SearchTab tab) {
    _selectedTabSubject.add(tab);
  }

  static SearchBloc createFromContext(
    BuildContext context, {
    required SearchTab startTab,
  }) =>
      SearchBloc(
        startTab: startTab,
        pleromaSearchService: IPleromaSearchService.of(
          context,
          listen: false,
        ),
      );
}
