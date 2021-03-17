import 'package:fedi/app/account/my/statuses/bookmarked/my_account_bookmarked_statuses_cached_list_bloc.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:fedi/repository/repository_model.dart';

var _statusRepositoryFilters = StatusRepositoryFilters(
  onlyBookmarked: true,
);

class MyAccountBookmarkedStatusesCachedListBloc extends AsyncInitLoadingBloc
    implements IMyAccountBookmarkedStatusesCachedListBloc {
  final IStatusRepository statusRepository;
  final IPleromaMyAccountService pleromaMyAccountService;

  MyAccountBookmarkedStatusesCachedListBloc({
    required this.pleromaMyAccountService,
    required this.statusRepository,
  });

  @override
  IPleromaApi get pleromaApi => pleromaMyAccountService;

  @override
  Stream<bool> get settingsChangedStream => Stream.empty();

  @override
  Future<List<IStatus>> loadLocalItems({
    int? limit,
    IStatus? newerThan,
    IStatus? olderThan,
  }) {
    return statusRepository.getStatuses(
      filters: _statusRepositoryFilters,
      pagination: RepositoryPagination<IStatus>(
        olderThanItem: olderThan,
        newerThanItem: newerThan,
        limit: limit,
      ),
    );
  }

  @override
  Stream<List<IStatus>> watchLocalItemsNewerThanItem(
    IStatus item,
  ) {
    return statusRepository.watchStatuses(
      filters: _statusRepositoryFilters,
      pagination: RepositoryPagination<IStatus>(
        newerThanItem: item,
      ),
    );
  }

  @override
  Future refreshItemsFromRemoteForPage({
    int? limit,
    IStatus? newerThan,
    IStatus? olderThan,
  }) async {
    var remoteStatuses = await pleromaMyAccountService.getBookmarks(
      pagination: PleromaPaginationRequest(
        sinceId: newerThan?.remoteId,
        maxId: olderThan?.remoteId,
        limit: limit,
      ),
    );

    await statusRepository.upsertRemoteStatuses(
      remoteStatuses,
      listRemoteId: null,
      conversationRemoteId: null,
    );
  }

  @override
  Future internalAsyncInit() async {
    // nothing
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
