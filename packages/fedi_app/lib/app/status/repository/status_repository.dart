import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/app/status/repository/status_repository_model.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IStatusRepository
    implements
        IAppRemoteReadWriteRepository<DbStatus, IStatus, IUnifediApiStatus, int,
            String, StatusRepositoryFilters, StatusRepositoryOrderingTermData>,
        IDisposable {
  static IStatusRepository of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IStatusRepository>(
        context,
        listen: listen,
      );

  Future<void> addStatusesToConversation({
    required List<String> statusRemoteIds,
    required String conversationRemoteId,
    required Batch? batchTransaction,
  });

  Future<void> upsertRemoteStatusForList(
    IUnifediApiStatus remoteStatus, {
    required String listRemoteId,
    required Batch? batchTransaction,
  });

  Future<void> upsertRemoteStatusForConversation(
    IUnifediApiStatus remoteStatus, {
    required String conversationRemoteId,
    required Batch? batchTransaction,
  });

  Future<void> upsertRemoteStatusForHomeTimeline(
    IUnifediApiStatus remoteStatus, {
    required bool isFromHomeTimeline,
    required Batch? batchTransaction,
  });

  Future<void> upsertRemoteStatusesForList(
    List<IUnifediApiStatus> remoteStatuses, {
    required String listRemoteId,
    required Batch? batchTransaction,
  });

  Future<void> upsertRemoteStatusesForConversation(
    List<IUnifediApiStatus> remoteStatuses, {
    required String conversationRemoteId,
    required Batch? batchTransaction,
  });

  Future<void> upsertRemoteStatusesForHomeTimeline(
    List<IUnifediApiStatus> remoteStatuses, {
    required bool isFromHomeTimeline,
    required Batch? batchTransaction,
  });

  Future<void> incrementRepliesCount({
    required String remoteId,
  });

  Future<void> removeAccountStatusesFromHome({
    required String accountRemoteId,
    required Batch? batchTransaction,
  });

  Future<void> markStatusAsDeleted({
    required String statusRemoteId,
  });

  Future<void> markStatusAsHiddenLocallyOnDevice({
    required int localId,
  });

  Future<void> clearListStatusesConnection({
    required String listRemoteId,
    required Batch? batchTransaction,
  });

  Future<Map<IConversationChat, IStatus?>> getConversationsLastStatus({
    required List<IConversationChat> conversations,
    bool onlyPendingStatePublishedOrNull = false,
  });

  Stream<IStatus?> watchConversationLastStatus({
    required IConversationChat conversation,
    bool onlyPendingStatePublishedOrNull = false,
  });

  Future<IStatus?> getConversationLastStatus({
    required IConversationChat conversation,
    bool onlyPendingStatePublishedOrNull = false,
  });

  Future<IStatus?> findByOldPendingRemoteId(
    String oldPendingRemoteId,
  );

  Stream<IStatus?> watchByOldPendingRemoteId(
    String oldPendingRemoteId,
  );

  Future<void> addStatusToConversation({
    required String statusRemoteId,
    required String conversationRemoteId,
    required Batch? batchTransaction,
  });

  Future<void> removeStatusFromConversation({
    required String statusRemoteId,
    required String conversationRemoteId,
    required Batch? batchTransaction,
  });

  Future<void> upsertRemoteStatusWithAllArguments(
    IUnifediApiStatus remoteStatus, {
    required bool? isFromHomeTimeline,
    required String? listRemoteId,
    required String? conversationRemoteId,
    required Batch? batchTransaction,
  });

  Future<void> upsertRemoteStatusesWithAllArguments(
    List<IUnifediApiStatus> remoteStatuses, {
    required bool? isFromHomeTimeline,
    required String? listRemoteId,
    required String? conversationRemoteId,
    required Batch? batchTransaction,
  });

  Future<IStatus?> findNewestForHomeTimeline();

  Stream<int> watchNewestCountForHomeTimeline({
    required IStatus lastSeenStatus,
  });
}
