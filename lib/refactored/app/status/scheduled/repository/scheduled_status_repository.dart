import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/status/scheduled/repository/scheduled_status_repository_model.dart';
import 'package:fedi/refactored/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/refactored/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IScheduledStatusRepository
    implements
        Disposable,
        IReadIdListRepository<IScheduledStatus, int>,
        IWriteIdListRepository<DbScheduledStatus, int> {
  static IScheduledStatusRepository of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IScheduledStatusRepository>(context, listen: listen);

  Future upsertRemoteScheduledStatuses(
      List<IPleromaScheduledStatus> remoteScheduledStatuses);

  Future upsertRemoteScheduledStatus(
      IPleromaScheduledStatus remoteScheduledStatus);

  Future updateLocalScheduledStatusByRemoteScheduledStatus(
      {@required IScheduledStatus oldLocalScheduledStatus,
        @required IPleromaScheduledStatus newRemoteScheduledStatus});

  Future<IScheduledStatus> findByRemoteId(String remoteId);

  Stream<IScheduledStatus> watchByRemoteId(String remoteId);

  Future<List<IScheduledStatus>> getScheduledStatuses(
      {@required IScheduledStatus olderThan,
      @required IScheduledStatus newerThan,
      @required int limit,
      @required int offset,
      @required ScheduledStatusOrderingTermData orderingTermData});

  Stream<List<IScheduledStatus>> watchScheduledStatuses(
      {@required IScheduledStatus olderThan,
      @required IScheduledStatus newerThan,
      @required int limit,
      @required int offset,
      @required ScheduledStatusOrderingTermData orderingTermData});

  Future<IScheduledStatus> getScheduledStatus(
      {@required IScheduledStatus olderThan,
      @required IScheduledStatus newerThan,
      
      @required ScheduledStatusOrderingTermData orderingTermData});

  Stream<IScheduledStatus> watchScheduledStatus(
      {@required IScheduledStatus olderThan,
      @required IScheduledStatus newerThan,
      
      @required ScheduledStatusOrderingTermData orderingTermData});
}
