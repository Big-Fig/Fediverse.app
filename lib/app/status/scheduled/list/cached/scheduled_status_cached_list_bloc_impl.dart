import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/list/status_list_bloc.dart';
import 'package:fedi/app/status/scheduled/list/cached/scheduled_status_cached_list_bloc.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository_model.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:provider/provider.dart';

var _logger = Logger('scheduled_status_cached_list_bloc_impl.dart');

const _excludeCanceled = true;
const _excludeScheduleAtExpired = true;

class ScheduledStatusCachedListBloc extends IScheduledStatusCachedListBloc {
  final IScheduledStatusRepository scheduledStatusRepository;
  final IUnifediApiStatusService pleromaScheduledStatusService;

  ScheduledStatusRepositoryFilters get _scheduledStatusRepositoryFilters =>
      ScheduledStatusRepositoryFilters(
        excludeCanceled: _excludeCanceled,
        excludeScheduleAtExpired: _excludeScheduleAtExpired,
      );

  ScheduledStatusCachedListBloc({
    required this.scheduledStatusRepository,
    required this.pleromaScheduledStatusService,
  }) : super();

  @override
  IUnifediApiService get unifediApi => pleromaScheduledStatusService;

  static ScheduledStatusCachedListBloc createFromContext(
    BuildContext context,
  ) =>
      ScheduledStatusCachedListBloc(
        pleromaScheduledStatusService:
            Provider.of<IUnifediApiStatusService>(
          context,
          listen: false,
        ),
        scheduledStatusRepository:
            IScheduledStatusRepository.of(context, listen: false),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) {
    return DisposableProvider<IScheduledStatusCachedListBloc>(
      create: (context) =>
          ScheduledStatusCachedListBloc.createFromContext(context),
      child: ProxyProvider<IScheduledStatusCachedListBloc, IStatusListBloc>(
        update: (context, value, previous) => value,
        child: child,
      ),
    );
  }

  @override
  Future<List<IScheduledStatus>> loadLocalItems({
    required int? limit,
    required IScheduledStatus? newerThan,
    required IScheduledStatus? olderThan,
  }) async {
    var statuses = await scheduledStatusRepository.findAllInAppType(
      filters: _scheduledStatusRepositoryFilters,
      pagination: RepositoryPagination(
        olderThanItem: olderThan,
        newerThanItem: newerThan,
        limit: limit,
      ),
      orderingTerms: [
        ScheduledStatusRepositoryOrderingTermData.remoteIdDesc,
      ],
    );

    return statuses;
  }

  @override
  Stream<List<IScheduledStatus>> watchLocalItemsNewerThanItem(
    IScheduledStatus? item,
  ) =>
      scheduledStatusRepository.watchFindAllInAppType(
        filters: _scheduledStatusRepositoryFilters,
        pagination: RepositoryPagination(
          newerThanItem: item,
        ),
        orderingTerms: [
          ScheduledStatusRepositoryOrderingTermData.remoteIdDesc,
        ],
      );

  @override
  Future refreshItemsFromRemoteForPage({
    required int? limit,
    required IScheduledStatus? newerThan,
    required IScheduledStatus? olderThan,
  }) async {
    _logger.finest(() => 'refreshItemsFromRemoteForPage \n'
        '\t limit=$limit'
        '\t newerThan=$newerThan'
        '\t olderThan=$olderThan');

    var remoteStatuses =
        await pleromaScheduledStatusService.getScheduledStatuses(
      pagination: UnifediApiPagination(
        limit: limit,
        minId: newerThan?.remoteId,
        maxId: olderThan?.remoteId,
      ),
    );

    await scheduledStatusRepository.upsertAllInRemoteType(
      remoteStatuses,
      batchTransaction: null,
    );
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
