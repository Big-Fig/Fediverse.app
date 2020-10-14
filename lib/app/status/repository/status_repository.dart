import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/conversation/conversation_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/repository/repository.dart';
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
      {@required String listRemoteId,
      @required String conversationRemoteId,
      bool isFromHomeTimeline = false});

  Stream<IStatus> watchByRemoteId(String remoteId);

  Future updateLocalStatusByRemoteStatus(
      {@required IStatus oldLocalStatus,
      @required IPleromaStatus newRemoteStatus,
      bool isFromHomeTimeline = false});

  Future upsertRemoteStatus(IPleromaStatus remoteStatus,
      {@required String listRemoteId,
      @required String conversationRemoteId,
      bool isFromHomeTimeline = false});

  Future<List<IStatus>> getStatuses({
    @required String onlyInListWithRemoteId,
    @required String onlyWithHashtag,
    @required IAccount onlyFromAccountsFollowingByAccount,
    @required IAccount onlyFromAccount,
    @required IConversation onlyInConversation,
    @required OnlyLocalStatusFilter onlyLocal,
    @required bool onlyWithMedia,
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
    @required IStatus olderThanStatus,
    @required IStatus newerThanStatus,
    @required bool onlyNoNsfwSensitive,
    @required bool onlyNoReplies,
    @required int limit,
    @required int offset,
    @required StatusOrderingTermData orderingTermData,
    @required bool isFromHomeTimeline,
    @required bool onlyFavourited,
    @required bool onlyBookmarked,
    bool onlyNotDeleted = true,
  });

  Stream<List<IStatus>> watchStatuses({
    @required String onlyInListWithRemoteId,
    @required String onlyWithHashtag,
    @required IAccount onlyFromAccountsFollowingByAccount,
    @required IAccount onlyFromAccount,
    @required IConversation onlyInConversation,
    @required OnlyLocalStatusFilter onlyLocal,
    @required bool onlyWithMedia,
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
    @required IStatus olderThanStatus,
    @required IStatus newerThanStatus,
    @required bool onlyNoNsfwSensitive,
    @required bool onlyNoReplies,
    @required int limit,
    @required int offset,
    @required StatusOrderingTermData orderingTermData,
    @required bool isFromHomeTimeline,
    @required bool onlyFavourited,
    @required bool onlyBookmarked,
    bool onlyNotDeleted = true,
  });

  Future<IStatus> getStatus({
    @required String onlyInListWithRemoteId,
    @required String onlyWithHashtag,
    @required IAccount onlyFromAccountsFollowingByAccount,
    @required IAccount onlyFromAccount,
    @required IConversation onlyInConversation,
    @required OnlyLocalStatusFilter onlyLocal,
    @required bool onlyWithMedia,
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
    @required IStatus olderThanStatus,
    @required IStatus newerThanStatus,
    @required bool onlyNoNsfwSensitive,
    @required bool onlyNoReplies,
    @required StatusOrderingTermData orderingTermData,
    @required bool isFromHomeTimeline,
    @required bool onlyFavourited,
    @required bool onlyBookmarked,
    bool onlyNotDeleted = true,
  });

  Stream<IStatus> watchStatus({
    @required String onlyInListWithRemoteId,
    @required String onlyWithHashtag,
    @required IAccount onlyFromAccountsFollowingByAccount,
    @required IAccount onlyFromAccount,
    @required IConversation onlyInConversation,
    @required OnlyLocalStatusFilter onlyLocal,
    @required bool onlyWithMedia,
    @required bool withMuted,
    @required List<PleromaVisibility> excludeVisibilities,
    @required IStatus olderThanStatus,
    @required IStatus newerThanStatus,
    @required bool onlyNoNsfwSensitive,
    @required bool onlyNoReplies,
    @required StatusOrderingTermData orderingTermData,
    @required bool isFromHomeTimeline,
    @required bool onlyFavourited,
    @required bool onlyBookmarked,
    bool onlyNotDeleted = true,
  });

  Stream<IStatus> watchConversationLastStatus({
    @required IConversation conversation,
    bool onlyNotDeleted = true,
  });

  Future<IStatus> getConversationLastStatus({
    @required IConversation conversation,
    bool onlyNotDeleted = true,
  });

  Future incrementRepliesCount({@required String remoteId});

  Future removeAccountStatusesFromHome({
    @required String accountRemoteId,
  });

  Future markStatusAsDeleted({@required String statusRemoteId});

  Future clearListStatusesConnection({@required String listRemoteId});
}
