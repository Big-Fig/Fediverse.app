import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/list/cached/filter_cached_list_bloc.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/filter/repository/filter_repository_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class FilterCachedListBloc extends IFilterCachedListBloc {
  final IUnifediApiFilterService unifediApiFilterService;
  final IFilterRepository filterRepository;

  @override
  IUnifediApiService get unifediApi => unifediApiFilterService;

  FilterCachedListBloc({
    required this.unifediApiFilterService,
    required this.filterRepository,
  });

  @override
  Future<List<IFilter>> loadLocalItems({
    required int? limit,
    required IFilter? newerThan,
    required IFilter? olderThan,
  }) =>
      filterRepository.findAllInAppType(
        pagination: RepositoryPagination(
          olderThanItem: olderThan,
          newerThanItem: newerThan,
          limit: limit,
        ),
        filters: FilterRepositoryFilters(
          notExpired: false,
        ),
        orderingTerms: [
          FilterOrderingTermData.remoteIdDesc,
        ],
      );

  @override
  Future refreshItemsFromRemoteForPage({
    required int? limit,
    required IFilter? newerThan,
    required IFilter? olderThan,
  }) async {
    // todo: dont exclude pleroma types on mastodon instances
    var remoteFilters = await unifediApiFilterService.getFilters(
      pagination: UnifediApiPagination(
        maxId: olderThan?.remoteId,
        minId: newerThan?.remoteId,
        limit: limit,
      ),
    );

    await filterRepository.upsertAllInRemoteType(
      remoteFilters,
      batchTransaction: null,
    );
  }

  static FilterCachedListBloc createFromContext(BuildContext context) =>
      FilterCachedListBloc(
        unifediApiFilterService: Provider.of<IUnifediApiFilterService>(
          context,
          listen: false,
        ),
        filterRepository: IFilterRepository.of(
          context,
          listen: false,
        ),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProvider<IFilterCachedListBloc>(
        create: (context) => FilterCachedListBloc.createFromContext(
          context,
        ),
        child: child,
      );
}
