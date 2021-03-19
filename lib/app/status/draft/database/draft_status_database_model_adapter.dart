import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/draft/draft_status_model.dart';

DbDraftStatus mapDraftStatusToDbDraftStatus(IDraftStatus draftStatus) =>
    DbDraftStatus(
      id: draftStatus.localId,
      data: draftStatus.postStatusData,
      updatedAt: draftStatus.updatedAt,
    );
