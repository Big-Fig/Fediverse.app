import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_repository_model.dart';
import 'package:fedi/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusRepository
    implements
        IReadIdListRepository<IStatus, int>,
        IWriteIdListRepository<DbStatusWrapper, int> {
  static IStatusRepository of(BuildContext context, {bool listen = true}) =>
      Provider.of<IStatusRepository>(context, listen: listen);

  Future refreshPublicStatuses({
    @required bool onlyLocal,
    @required bool onlyMedia,
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
    @required int limit,
  });

  Future<List<DbStatusWrapper>> getPublicStatuses(
      {@required bool onlyLocal,
      @required bool onlyMedia,
      @required bool withMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus notNewerThanStatus,
      @required IStatus notOlderThanStatus,
      @required int limit,
      @required StatusOrderingTermData orderingTermData});

  Stream<List<DbStatusWrapper>> watchPublicStatuses(
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

  Future<List<DbStatusWrapper>> getHomeStatuses(
      {@required bool onlyLocal,
      @required bool onlyMedia,
      @required bool withMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus notNewerThanStatus,
      @required IStatus notOlderThanStatus,
      @required int limit,
      @required StatusOrderingTermData orderingTermData});

  Stream<List<DbStatusWrapper>> watchHomeStatuses(
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

  Future<List<DbStatusWrapper>> getHashTagStatuses(
      {@required String hashTag,
      @required bool onlyLocal,
      @required bool onlyMedia,
      @required bool withMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus notNewerThanStatus,
      @required IStatus notOlderThanStatus,
      @required int limit,
      @required StatusOrderingTermData orderingTermData});

  Stream<List<DbStatusWrapper>> watchHashTagStatuses(
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

  Future<List<DbStatusWrapper>> getListStatuses(
      {@required String listRemoteId,
      @required bool onlyLocal,
      @required bool onlyMedia,
      @required bool withMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus notNewerThanStatus,
      @required IStatus notOlderThanStatus,
      @required int limit,
      @required StatusOrderingTermData orderingTermData});

  Stream<List<DbStatusWrapper>> watchListStatuses(
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
