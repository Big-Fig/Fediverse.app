import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_repository_model.dart';
import 'package:fedi/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusRepository
    implements
        IReadIdListRepository<IStatus, int>,
        IWriteIdListRepository<DbStatus, int> {
  static IStatusRepository of(BuildContext context, {bool listen = true}) =>
      Provider.of<IStatusRepository>(context, listen: listen);

  Future<IStatus> findByRemoteId(String remoteId);
  Future<int> upsertByRemoteId(DbStatus dbStatus);

  Future refreshPublicStatuses({
    @required bool onlyLocal,
    @required bool onlyMedia,
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
    @required int limit,
  });

  Future<List<DbStatusPopulatedWrapper>> getPublicStatuses(
      {@required bool onlyLocal,
      @required bool onlyMedia,
      @required bool withMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus notNewerThanStatus,
      @required IStatus notOlderThanStatus,
      @required int limit,
      @required StatusOrderingTermData orderingTermData});

  Stream<List<DbStatusPopulatedWrapper>> watchPublicStatuses(
      {@required bool onlyLocal,
      @required bool onlyMedia,
      @required bool withMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus notNewerThanStatus,
      @required IStatus notOlderThanStatus,
      @required int limit,
      @required StatusOrderingTermData orderingTermData});

  Future refreshHomeStatuses({
    @required bool onlyLocal,
    @required bool onlyMedia,
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
    @required int limit,
  });

  Future<List<DbStatusPopulatedWrapper>> getHomeStatuses(
      {@required bool onlyLocal,
      @required bool onlyMedia,
      @required bool withMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus notNewerThanStatus,
      @required IStatus notOlderThanStatus,
      @required int limit,
      @required StatusOrderingTermData orderingTermData});

  Stream<List<DbStatusPopulatedWrapper>> watchHomeStatuses(
      {@required bool onlyLocal,
      @required bool onlyMedia,
      @required bool withMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus notNewerThanStatus,
      @required IStatus notOlderThanStatus,
      @required int limit,
      @required StatusOrderingTermData orderingTermData});

  Future refreshHashTagStatuses({
    @required String hashTag,
    @required bool onlyLocal,
    @required bool onlyMedia,
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
    @required int limit,
  });

  Future<List<DbStatusPopulatedWrapper>> getHashTagStatuses(
      {@required String hashTag,
      @required bool onlyLocal,
      @required bool onlyMedia,
      @required bool withMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus notNewerThanStatus,
      @required IStatus notOlderThanStatus,
      @required int limit,
      @required StatusOrderingTermData orderingTermData});

  Stream<List<DbStatusPopulatedWrapper>> watchHashTagStatuses(
      {@required String hashTag,
      @required bool onlyLocal,
      @required bool onlyMedia,
      @required bool withMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus notNewerThanStatus,
      @required IStatus notOlderThanStatus,
      @required int limit,
      @required StatusOrderingTermData orderingTermData});

  Future refreshListStatuses({
    @required String listRemoteId,
    @required bool onlyLocal,
    @required bool onlyMedia,
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
    @required int limit,
  });

  Future<List<DbStatusPopulatedWrapper>> getListStatuses(
      {@required String listRemoteId,
      @required bool onlyLocal,
      @required bool onlyMedia,
      @required bool withMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus notNewerThanStatus,
      @required IStatus notOlderThanStatus,
      @required int limit,
      @required StatusOrderingTermData orderingTermData});

  Stream<List<DbStatusPopulatedWrapper>> watchListStatuses(
      {@required String listRemoteId,
      @required bool onlyLocal,
      @required bool onlyMedia,
      @required bool withMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus notNewerThanStatus,
      @required IStatus notOlderThanStatus,
      @required int limit,
      @required StatusOrderingTermData orderingTermData});
}
