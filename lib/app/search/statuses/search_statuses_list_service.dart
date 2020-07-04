import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_service.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/mastodon/search/mastodon_search_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/search/pleroma_search_model.dart';
import 'package:fedi/pleroma/search/pleroma_search_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:flutter/widgets.dart';

class SearchStatusesListService extends IStatusNetworkOnlyListService {
  final IPleromaSearchService pleromaSearchService;

  final ISearchInputBloc searchInputBloc;

  SearchStatusesListService({
    @required this.pleromaSearchService,
    @required this.searchInputBloc,
  });

  @override
  Future<List<IStatus>> loadItemsFromRemoteForPage(
      {@required int itemsCountPerPage,
      @required int pageIndex,
      @required String minId,
      @required String maxId}) async {
    var query = searchInputBloc.confirmedSearchTerm;
    List<IPleromaStatus> statuses;

    if (query?.isNotEmpty == true) {
      var offset = pageIndex * itemsCountPerPage;
      if (offset > 0) {
        //hack because backend include last item in next page too
        offset += 1;
      }
      var searchResult = await pleromaSearchService.search(
          request: PleromaSearchRequest(
              type: MastodonSearchRequestType.statuses,
              offset: offset,
              resolve: true,
              limit: itemsCountPerPage,
              query: query));

      statuses = searchResult.statuses;
    } else {
      statuses = [];
    }

    return statuses.map(mapRemoteStatusToLocalStatus).toList();
  }

  @override
  IPleromaApi get pleromaApi => pleromaSearchService;

  static SearchStatusesListService createFromContext(BuildContext context) =>
      SearchStatusesListService(
          searchInputBloc: ISearchInputBloc.of(context, listen: false),
          pleromaSearchService:
              IPleromaSearchService.of(context, listen: false));
}
