import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/app/status/post/post_status_data_status_status_adapter.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:flutter/widgets.dart';

abstract class IDraftStatus {
  int get localId;

  DateTime get updatedAt;

  PostStatusData get postStatusData;
}

class DbDraftStatusWrapper implements IDraftStatus {
  final DbDraftStatus dbDraftStatus;

  DbDraftStatusWrapper(this.dbDraftStatus);

  @override
  int get localId => dbDraftStatus.id;

  @override
  PostStatusData get postStatusData => dbDraftStatus.data;

  @override
  DateTime get updatedAt => dbDraftStatus.updatedAt;
}

class DraftStatusAdapterToStatus extends PostStatusDataStatusStatusAdapter {
  final IDraftStatus draftStatus;

  DraftStatusAdapterToStatus({
    @required IAccount account,
    @required this.draftStatus,
  }) : super(
          localId: draftStatus.localId,
          account: account,
          postStatusData: draftStatus.postStatusData,
          createdAt: draftStatus.updatedAt,
          pendingState: PendingState.notSentYet,
          oldPendingRemoteId: null,
          wasSentWithIdempotencyKey: null,
        );

  @override
  bool get hiddenLocallyOnDevice => false;
}

enum DraftStatusState { draft, canceled, alreadyPosted }
