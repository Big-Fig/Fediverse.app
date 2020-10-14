import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/draft/draft_status_model.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IDraftStatusRepository
    implements
        Disposable,
        IReadIdListRepository<IDraftStatus, int>,
        IWriteIdListRepository<DbDraftStatus, int> {
  static IDraftStatusRepository of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IDraftStatusRepository>(context, listen: listen);

  Future addDraftStatus({
    @required IDraftStatus draftStatus,
  });

  Future<List<IDraftStatus>> getDraftStatuses(
      {@required IDraftStatus olderThan,
      @required IDraftStatus newerThan,
      @required int limit,
      @required int offset,
      @required DraftStatusOrderingTermData orderingTermData});

  Stream<List<IDraftStatus>> watchDraftStatuses(
      {@required IDraftStatus olderThan,
      @required IDraftStatus newerThan,
      @required int limit,
      @required int offset,
      @required DraftStatusOrderingTermData orderingTermData});

  Future<IDraftStatus> getDraftStatus(
      {@required IDraftStatus olderThan,
      @required IDraftStatus newerThan,
      @required DraftStatusOrderingTermData orderingTermData});

  Stream<IDraftStatus> watchDraftStatus(
      {@required IDraftStatus olderThan,
      @required IDraftStatus newerThan,
      @required DraftStatusOrderingTermData orderingTermData});
}
