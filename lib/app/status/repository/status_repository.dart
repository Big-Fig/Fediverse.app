import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:fedi/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';

abstract class IStatusRepository
    implements
        IAppRemoteReadWriteRepository<DbStatus, IStatus, IPleromaApiStatus, int,
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

  Future addStatusesToConversation({
    required List<String> statusRemoteIds,
    required String conversationRemoteId,
    required Batch? batchTransaction,
  });

  Future upsertRemoteStatusForList(
    IPleromaApiStatus remoteStatus, {
    required String listRemoteId,
    required Batch? batchTransaction,
  });

  Future upsertRemoteStatusForConversation(
    IPleromaApiStatus remoteStatus, {
    required String conversationRemoteId,
    required Batch? batchTransaction,
  });

  Future upsertRemoteStatusForHomeTimeline(
    IPleromaApiStatus remoteStatus, {
    required bool isFromHomeTimeline,
    required Batch? batchTransaction,
  });

  Future upsertRemoteStatusesForList(
    List<IPleromaApiStatus> remoteStatuses, {
    required String listRemoteId,
    required Batch? batchTransaction,
  });

  Future upsertRemoteStatusesForConversation(
    List<IPleromaApiStatus> remoteStatuses, {
    required String conversationRemoteId,
    required Batch? batchTransaction,
  });

  Future upsertRemoteStatusesForHomeTimeline(
    List<IPleromaApiStatus> remoteStatuses, {
    required bool isFromHomeTimeline,
    required Batch? batchTransaction,
  });

  Future incrementRepliesCount({
    required String remoteId,
  });

  Future removeAccountStatusesFromHome({
    required String accountRemoteId,
    required Batch? batchTransaction,
  });

  Future markStatusAsDeleted({
    required String statusRemoteId,
  });

  Future markStatusAsHiddenLocallyOnDevice({
    required int localId,
  });

  Future clearListStatusesConnection({
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

  Future addStatusToConversation({
    required String statusRemoteId,
    required String conversationRemoteId,
    required Batch? batchTransaction,
  });

  Future removeStatusFromConversation({
    required String statusRemoteId,
    required String conversationRemoteId,
    required Batch? batchTransaction,
  });

  Future upsertRemoteStatusWithAllArguments(
    IPleromaApiStatus remoteStatus, {
    required bool? isFromHomeTimeline,
    required String? listRemoteId,
    required String? conversationRemoteId,
    required Batch? batchTransaction,
  });

  Future upsertRemoteStatusesWithAllArguments(
    List<IPleromaApiStatus> remoteStatuses, {
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
