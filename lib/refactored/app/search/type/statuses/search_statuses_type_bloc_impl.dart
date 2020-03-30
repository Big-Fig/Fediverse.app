import 'package:fedi/refactored/app/search/tab/search_tab_bloc_impl.dart';
import 'package:fedi/refactored/app/search/search_tab_model.dart';
import 'package:fedi/refactored/app/search/tab/statuses/search_statuses_tab_bloc.dart';
import 'package:fedi/refactored/app/status/status_model.dart';

class SearchStatusesTabBloc extends SearchTabBloc<IStatus>
    implements ISearchStatusesTabBloc {
  final IPleromaSearchService pleromaSearchService;

  SearchStatusesTabBloc({@required this.pleromaSearchService});
}
