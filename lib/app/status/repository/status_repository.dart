import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/status/status_model.dart';
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

  Future<List<DbStatusPopulatedWrapper>> getStatuses(
      {@required String inListWithRemoteId,
      @required String withHashTag,
      @required IAccount onlyFollowingByAccount,
      @required String localUrlHost,
      @required bool onlyLocal,
      @required bool onlyMedia,
      @required bool notMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required String olderThanStatusRemoteId,
      @required String newerThanStatusRemoteId,
      @required bool noNsfwSensitive,
      @required bool noReplies,
      @required int limit,
      @required int offset,
      @required StatusOrderingTermData orderingTermData});

  Stream<List<DbStatusPopulatedWrapper>> watchStatuses(
      {@required String inListWithRemoteId,
      @required String withHashTag,
      @required IAccount onlyFollowingByAccount,
      @required String localUrlHost,
      @required bool onlyLocal,
      @required bool onlyMedia,
      @required bool notMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required String olderThanStatusRemoteId,
      @required String newerThanStatusRemoteId,
      @required bool noNsfwSensitive,
      @required bool noReplies,
      @required int limit,
      @required int offset,
      @required StatusOrderingTermData orderingTermData});
}
