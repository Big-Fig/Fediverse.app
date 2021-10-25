import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/status/list/status_list_bloc.dart';
import 'package:fedi_app/app/status/scheduled/list/cached/scheduled_status_cached_list_bloc.dart';
import 'package:fedi_app/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:fedi_app/app/status/scheduled/repository/scheduled_status_repository_model.dart';
import 'package:fedi_app/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi_app/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('scheduled_status_cached_list_bloc_impl.dart');

const _excludeCanceled = true;
const _excludeScheduleAtExpired = true;

class ScheduledStatusCachedListBloc extends IScheduledStatusCachedListBloc {
  final IScheduledStatusRepository scheduledStatusRepository;
  final IUnifediApiStatusService unifediScheduledStatusService;

  ScheduledStatusRepositoryFilters get _scheduledStatusRepositoryFilters =>
      const ScheduledStatusRepositoryFilters(
        excludeCanceled: _excludeCanceled,
        excludeScheduleAtExpired: _excludeScheduleAtExpired,
      );

  ScheduledStatusCachedListBloc({
    required this.scheduledStatusRepository,
    required this.unifediScheduledStatusService,
  }) : super();

  @override
  IUnifediApiService get unifediApi => unifediScheduledStatusService;

  static ScheduledStatusCachedListBloc createFromContext(
    BuildContext context,
  ) =>
      ScheduledStatusCachedListBloc(
        unifediScheduledStatusService: Provider.of<IUnifediApiStatusService>(
          context,
          listen: false,
        ),
        scheduledStatusRepository:
            IScheduledStatusRepository.of(context, listen: false),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProvider<IScheduledStatusCachedListBloc>(
        create: ScheduledStatusCachedListBloc.createFromContext,
        child: ProxyProvider<IScheduledStatusCachedListBloc, IStatusListBloc>(
          update: (context, value, previous) => value,
          child: child,
        ),
      );

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
  Future<void> refreshItemsFromRemoteForPage({
    required int? limit,
    required IScheduledStatus? newerThan,
    required IScheduledStatus? olderThan,
  }) async {
    _logger.finest(
      () => 'refreshItemsFromRemoteForPage \n'
          '\t limit=$limit'
          '\t newerThan=$newerThan'
          '\t olderThan=$olderThan',
    );

    var remoteStatuses =
        await unifediScheduledStatusService.getScheduledStatuses(
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
