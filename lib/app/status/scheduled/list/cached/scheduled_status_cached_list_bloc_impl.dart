import 'package:fedi/app/status/scheduled/list/cached/scheduled_status_cached_list_bloc.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository_model.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/status/scheduled/pleroma_scheduled_status_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("account_statuses_bloc_impl.dart");

final _excludeCanceled = true;
final _excludeScheduleAtExpired = true;

class ScheduledStatusCachedListBloc extends IScheduledStatusCachedListBloc {
  final IScheduledStatusRepository scheduledStatusRepository;
  final IPleromaScheduledStatusService pleromaScheduledStatusService;

  ScheduledStatusCachedListBloc(
      {@required this.scheduledStatusRepository,
      @required this.pleromaScheduledStatusService})
      : super();

  @override
  IPleromaApi get pleromaApi => pleromaScheduledStatusService;

  static ScheduledStatusCachedListBloc createFromContext(
          BuildContext context) =>
      ScheduledStatusCachedListBloc(
          pleromaScheduledStatusService:
              IPleromaScheduledStatusService.of(context, listen: false),
          scheduledStatusRepository:
              IScheduledStatusRepository.of(context, listen: false));

  static Widget provideToContext(BuildContext context,
      {@required Widget child}) {
    return DisposableProvider<IScheduledStatusCachedListBloc>(
      create: (context) =>
          ScheduledStatusCachedListBloc.createFromContext(context),
      child: child,
    );
  }

  @override
  Future<List<IScheduledStatus>> loadLocalItems(
      {@required int limit,
      @required IScheduledStatus newerThan,
      @required IScheduledStatus olderThan}) async {
    var statuses = await scheduledStatusRepository.getScheduledStatuses(
        olderThan: olderThan,
        newerThan: newerThan,
        limit: limit,
        offset: null,
        orderingTermData: ScheduledStatusOrderingTermData(
            orderingMode: OrderingMode.desc,
            orderByType: ScheduledStatusOrderByType.remoteId),
        excludeCanceled: _excludeCanceled,
        excludeScheduleAtExpired: _excludeScheduleAtExpired);

    return statuses;
  }

  @override
  Stream<List<IScheduledStatus>> watchLocalItemsNewerThanItem(
          IScheduledStatus item) =>
      scheduledStatusRepository.watchScheduledStatuses(
          olderThan: null,
          newerThan: item,
          limit: null,
          offset: null,
          orderingTermData: ScheduledStatusOrderingTermData(
              orderingMode: OrderingMode.desc,
              orderByType: ScheduledStatusOrderByType.remoteId),
          excludeCanceled: _excludeCanceled,
          excludeScheduleAtExpired: _excludeScheduleAtExpired);

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required IScheduledStatus newerThan,
      @required IScheduledStatus olderThan}) async {
    _logger.finest(() => "refreshItemsFromRemoteForPage \n"
        "\t limit=$limit"
        "\t newerThan=$newerThan"
        "\t olderThan=$olderThan");

    try {
      var remoteStatuses =
          await pleromaScheduledStatusService.getScheduledStatuses(
              limit: limit,
              sinceId: newerThan?.remoteId,
              maxId: olderThan?.remoteId);

      if (remoteStatuses != null) {
        await scheduledStatusRepository
            .upsertRemoteScheduledStatuses(remoteStatuses);

        return true;
      } else {
        _logger.severe(() => "error during refreshItemsFromRemoteForPage: "
            "statuses is null");
        return false;
      }
    } catch (e, stackTrace) {
      _logger.severe(
          () => "error during refreshItemsFromRemoteForPage", e, stackTrace);
      return false;
    }
  }
}
