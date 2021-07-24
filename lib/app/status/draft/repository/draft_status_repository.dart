import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/draft/draft_status_model.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IDraftStatusRepository
    implements
        IDisposable,
        IAppReadWriteRepository<
            DbDraftStatus,
            IDraftStatus,
            int,
            DraftStatusRepositoryFilters,
            DraftStatusRepositoryOrderingTermData> {
  static IDraftStatusRepository of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IDraftStatusRepository>(context, listen: listen);

  Future addDraftStatus({
    required IDraftStatus draftStatus,
  });
}
