import 'package:fedi/app/account/my/statuses/favourited/my_account_favourited_statuses_cached_list_bloc.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _statusRepositoryFilters = StatusRepositoryFilters.only(
  onlyFavourited: true,
);

class MyAccountFavouritedStatusesCachedListBloc extends AsyncInitLoadingBloc
    implements IMyAccountFavouritedStatusesCachedListBloc {
  final IStatusRepository statusRepository;
  final IUnifediApiMyAccountService unifediApiMyAccountService;

  MyAccountFavouritedStatusesCachedListBloc({
    required this.unifediApiMyAccountService,
    required this.statusRepository,
  });

  @override
  IUnifediApiService get unifediApi => unifediApiMyAccountService;

  @override
  Stream<bool> get settingsChangedStream => const Stream.empty();

  @override
  Future<List<IStatus>> loadLocalItems({
    int? limit,
    IStatus? newerThan,
    IStatus? olderThan,
  }) =>
      statusRepository.findAllInAppType(
        filters: _statusRepositoryFilters,
        pagination: RepositoryPagination<IStatus>(
          olderThanItem: olderThan,
          newerThanItem: newerThan,
          limit: limit,
        ),
        orderingTerms: [
          StatusRepositoryOrderingTermData.remoteIdDesc,
        ],
      );

  @override
  Stream<List<IStatus>> watchLocalItemsNewerThanItem(
    IStatus? item,
  ) =>
      statusRepository.watchFindAllInAppType(
        filters: _statusRepositoryFilters,
        pagination: RepositoryPagination<IStatus>(
          newerThanItem: item,
        ),
        orderingTerms: [
          StatusRepositoryOrderingTermData.remoteIdDesc,
        ],
      );

  @override
  Future refreshItemsFromRemoteForPage({
    int? limit,
    IStatus? newerThan,
    IStatus? olderThan,
  }) async {
    var remoteStatuses = await unifediApiMyAccountService.getMyFavourites(
      pagination: UnifediApiPagination(
        minId: newerThan?.remoteId,
        maxId: olderThan?.remoteId,
        limit: limit,
      ),
    );

    await statusRepository.upsertAllInRemoteType(
      remoteStatuses,
      batchTransaction: null,
    );
  }

  @override
  // ignore: no-empty-block
  Future internalAsyncInit() async {
    // nothing
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
