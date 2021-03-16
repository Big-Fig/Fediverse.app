import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/draft/draft_status_model.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/repository/repository.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IDraftStatusRepository
    implements
        IDisposable,
        IReadIdListRepository<IDraftStatus, int?>,
        IWriteIdListRepository<DbDraftStatus, int?> {
  static IDraftStatusRepository of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IDraftStatusRepository>(context, listen: listen);

  Future addDraftStatus({
    required IDraftStatus draftStatus,
  });

  Future<List<IDraftStatus>> getDraftStatuses({
    required ScheduledStatusRepositoryFilters? filters,
    required RepositoryPagination<IDraftStatus> pagination,
    DraftStatusOrderingTermData orderingTermData =
        DraftStatusOrderingTermData.updatedAtDesc,
  });

  Stream<List<IDraftStatus>> watchDraftStatuses({
    required ScheduledStatusRepositoryFilters filters,
    required RepositoryPagination<IDraftStatus> pagination,
    DraftStatusOrderingTermData orderingTermData =
        DraftStatusOrderingTermData.updatedAtDesc,
  });

  Future<IDraftStatus?> getDraftStatus({
    required ScheduledStatusRepositoryFilters filters,
    DraftStatusOrderingTermData orderingTermData =
        DraftStatusOrderingTermData.updatedAtDesc,
  });

  Stream<IDraftStatus?> watchDraftStatus({
    required ScheduledStatusRepositoryFilters filters,
    DraftStatusOrderingTermData orderingTermData =
        DraftStatusOrderingTermData.updatedAtDesc,
  });
}
