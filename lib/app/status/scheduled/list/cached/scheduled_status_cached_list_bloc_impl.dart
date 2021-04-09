import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/list/status_list_bloc.dart';
import 'package:fedi/app/status/scheduled/list/cached/scheduled_status_cached_list_bloc.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository_model.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:fedi/pleroma/status/scheduled/pleroma_scheduled_status_service.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("scheduled_status_cached_list_bloc_impl.dart");

final _excludeCanceled = true;
final _excludeScheduleAtExpired = true;

class ScheduledStatusCachedListBloc extends IScheduledStatusCachedListBloc {
  final IScheduledStatusRepository scheduledStatusRepository;
  final IPleromaScheduledStatusService pleromaScheduledStatusService;

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
  IPleromaApi get pleromaApi => pleromaScheduledStatusService;

  static ScheduledStatusCachedListBloc createFromContext(
    BuildContext context,
  ) =>
      ScheduledStatusCachedListBloc(
        pleromaScheduledStatusService:
            IPleromaScheduledStatusService.of(context, listen: false),
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
    var statuses = await scheduledStatusRepository.getScheduledStatuses(
      filters: _scheduledStatusRepositoryFilters,
      pagination: RepositoryPagination(
        olderThanItem: olderThan,
        newerThanItem: newerThan,
        limit: limit,
      ),
      orderingTermData: ScheduledStatusRepositoryOrderingTermData.remoteIdDesc,
    );

    return statuses;
  }

  @override
  Stream<List<IScheduledStatus>> watchLocalItemsNewerThanItem(
    IScheduledStatus? item,
  ) =>
      scheduledStatusRepository.watchScheduledStatuses(
        filters: _scheduledStatusRepositoryFilters,
        pagination: RepositoryPagination(
          newerThanItem: item,
        ),
        orderingTermData: ScheduledStatusRepositoryOrderingTermData.remoteIdDesc,
      );

  @override
  Future refreshItemsFromRemoteForPage({
    required int? limit,
    required IScheduledStatus? newerThan,
    required IScheduledStatus? olderThan,
  }) async {
    _logger.finest(() => "refreshItemsFromRemoteForPage \n"
        "\t limit=$limit"
        "\t newerThan=$newerThan"
        "\t olderThan=$olderThan");

    var remoteStatuses =
        await pleromaScheduledStatusService.getScheduledStatuses(
      pagination: PleromaPaginationRequest(
        limit: limit,
        sinceId: newerThan?.remoteId,
        maxId: olderThan?.remoteId,
      ),
    );

    await scheduledStatusRepository
        .upsertRemoteScheduledStatuses(remoteStatuses);
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
