import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/status/repository/status_repository_model.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/refactored/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/refactored/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusRepository
    implements
        IReadIdListRepository<IStatus, int>,
        IWriteIdListRepository<DbStatus, int>,
        Disposable {
  static IStatusRepository of(BuildContext context, {bool listen = true}) =>
      Provider.of<IStatusRepository>(context, listen: listen);

  Future<IStatus> findByRemoteId(String remoteId);

  Future upsertRemoteStatuses(List<IPleromaStatus> remoteStatuses,
      {@required String listRemoteId, @required String conversationRemoteId});

  Stream<IStatus> watchByRemoteId(String remoteId);

  Future updateLocalStatusByRemoteStatus(
      {@required IStatus oldLocalStatus,
      @required IPleromaStatus newRemoteStatus});

  Future upsertRemoteStatus(IPleromaStatus remoteStatus,
      {@required String listRemoteId, @required String conversationRemoteId});

  Future<List<DbStatusPopulatedWrapper>> getStatuses(
      {@required String onlyInListWithRemoteId,
      @required String onlyWithHashtag,
      @required IAccount onlyFromAccountsFollowingByAccount,
      @required IAccount onlyFromAccount,
      @required IConversation onlyInConversation,
      @required OnlyLocalStatusFilter onlyLocal,
      @required bool onlyWithMedia,
      @required bool onlyNotMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus olderThanStatus,
      @required IStatus newerThanStatus,
      @required bool onlyNoNsfwSensitive,
      @required bool onlyNoReplies,
      @required int limit,
      @required int offset,
      @required StatusOrderingTermData orderingTermData});

  Stream<List<DbStatusPopulatedWrapper>> watchStatuses(
      {@required String onlyInListWithRemoteId,
      @required String onlyWithHashtag,
      @required IAccount onlyFromAccountsFollowingByAccount,
      @required IAccount onlyFromAccount,
      @required IConversation onlyInConversation,
      @required OnlyLocalStatusFilter onlyLocal,
      @required bool onlyWithMedia,
      @required bool onlyNotMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus olderThanStatus,
      @required IStatus newerThanStatus,
      @required bool onlyNoNsfwSensitive,
      @required bool onlyNoReplies,
      @required int limit,
      @required int offset,
      @required StatusOrderingTermData orderingTermData});

  Future<DbStatusPopulatedWrapper> getStatus(
      {@required String onlyInListWithRemoteId,
      @required String onlyWithHashtag,
      @required IAccount onlyFromAccountsFollowingByAccount,
      @required IAccount onlyFromAccount,
      @required IConversation onlyInConversation,
      @required OnlyLocalStatusFilter onlyLocal,
      @required bool onlyWithMedia,
      @required bool onlyNotMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus olderThanStatus,
      @required IStatus newerThanStatus,
      @required bool onlyNoNsfwSensitive,
      @required bool onlyNoReplies,
      @required StatusOrderingTermData orderingTermData});

  Stream<DbStatusPopulatedWrapper> watchStatus(
      {@required String onlyInListWithRemoteId,
      @required String onlyWithHashtag,
      @required IAccount onlyFromAccountsFollowingByAccount,
      @required IAccount onlyFromAccount,
      @required IConversation onlyInConversation,
      @required OnlyLocalStatusFilter onlyLocal,
      @required bool onlyWithMedia,
      @required bool onlyNotMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required IStatus olderThanStatus,
      @required IStatus newerThanStatus,
      @required bool onlyNoNsfwSensitive,
      @required bool onlyNoReplies,
      @required StatusOrderingTermData orderingTermData});
}
