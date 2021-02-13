import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/repository/repository.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusRepository
    implements
        IReadIdListRepository<IStatus, int>,
        IWriteIdListRepository<DbStatus, int>,
        IDisposable {
  static IStatusRepository of(BuildContext context, {bool listen = true}) =>
      Provider.of<IStatusRepository>(context, listen: listen);

  Future<IStatus> findByRemoteId(String remoteId);

  Future deleteByRemoteId(String remoteId);

  Future addStatusesToConversationWithDuplicatePreCheck({
    @required List<String> statusRemoteIds,
    @required String conversationRemoteId,
  });

  Future upsertRemoteStatuses(
    List<IPleromaStatus> remoteStatuses, {
    @required String listRemoteId,
    @required String conversationRemoteId,
    bool isFromHomeTimeline = false,
  });

  Stream<IStatus> watchByRemoteId(String remoteId);

  Future updateLocalStatusByRemoteStatus({
    @required IStatus oldLocalStatus,
    @required IPleromaStatus newRemoteStatus,
    bool isFromHomeTimeline = false,
  });

  Future upsertRemoteStatus(
    IPleromaStatus remoteStatus, {
    @required String listRemoteId,
    @required String conversationRemoteId,
    bool isFromHomeTimeline = false,
  });

  Future<List<IStatus>> getStatuses({
    @required StatusRepositoryFilters filters,
    @required RepositoryPagination<IStatus> pagination,
    StatusRepositoryOrderingTermData orderingTermData =
        StatusRepositoryOrderingTermData.remoteIdDesc,
  });

  Stream<List<IStatus>> watchStatuses({
    @required StatusRepositoryFilters filters,
    @required RepositoryPagination<IStatus> pagination,
    StatusRepositoryOrderingTermData orderingTermData =
        StatusRepositoryOrderingTermData.remoteIdDesc,
  });

  Future<IStatus> getStatus({
    @required StatusRepositoryFilters filters,
    StatusRepositoryOrderingTermData orderingTermData =
        StatusRepositoryOrderingTermData.remoteIdDesc,
  });

  Stream<IStatus> watchStatus({
    @required StatusRepositoryFilters filters,
    StatusRepositoryOrderingTermData orderingTermData =
        StatusRepositoryOrderingTermData.remoteIdDesc,
  });

  Future incrementRepliesCount({
    @required String remoteId,
  });

  Future removeAccountStatusesFromHome({
    @required String accountRemoteId,
  });

  Future markStatusAsDeleted({
    @required String statusRemoteId,
  });

  Future clearListStatusesConnection({
    @required String listRemoteId,
  });

  Future<Map<IConversationChat, IStatus>> getConversationsLastStatus({
    @required List<IConversationChat> conversations,
  });

  Stream<IStatus> watchConversationLastStatus({
    @required IConversationChat conversation,
  });

  Future<IStatus> getConversationLastStatus({
    @required IConversationChat conversation,
  });

  Future<IStatus> findByOldPendingRemoteId(
    String oldPendingRemoteId,
  );

  Stream<IStatus> watchByOldPendingRemoteId(
    String oldPendingRemoteId,
  );

  Future addStatusToConversation({
    @required String statusRemoteId,
    @required String conversationRemoteId,
  });

  Future removeStatusToConversation({
    @required String statusRemoteId,
    @required String conversationRemoteId,
  });
}
