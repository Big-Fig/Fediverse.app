import 'package:fedi/app/account/my/statuses/bookmarked/my_account_bookmarked_statuses_cached_list_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger =
    Logger("my_account_bookmarked_statuses_cached_list_bloc_impl.dart");

class MyAccountBookmarkedStatusesCachedListBloc extends DisposableOwner
    implements IMyAccountBookmarkedStatusesCachedListBloc {
  final IStatusRepository statusRepository;
  final IPleromaMyAccountService pleromaMyAccountService;

  MyAccountBookmarkedStatusesCachedListBloc({
    @required this.pleromaMyAccountService,
    @required this.statusRepository,
  });

  @override
  IPleromaApi get pleromaApi => pleromaMyAccountService;

  @override
  Stream<bool> get settingsChangedStream => Stream.empty();

  @override
  Future<List<IStatus>> loadLocalItems({
    int limit,
    IStatus newerThan,
    IStatus olderThan,
  }) {
    return statusRepository.getStatuses(
      onlyInListWithRemoteId: null,
      onlyWithHashtag: null,
      onlyFromAccountsFollowingByAccount: null,
      onlyFromAccount: null,
      onlyInConversation: null,
      onlyLocal: null,
      onlyWithMedia: null,
      onlyNotMuted: null,
      excludeVisibilities: null,
      olderThanStatus: olderThan,
      newerThanStatus: newerThan,
      onlyNoNsfwSensitive: null,
      onlyNoReplies: null,
      limit: limit,
      offset: null,
      orderingTermData: null,
      isFromHomeTimeline: null,
      onlyBookmarked: true,
      onlyFavourited: null,
    );
  }

  @override
  Stream<List<IStatus>> watchLocalItemsNewerThanItem(
    IStatus item,
  ) {
    return statusRepository.watchStatuses(
      onlyInListWithRemoteId: null,
      onlyWithHashtag: null,
      onlyFromAccountsFollowingByAccount: null,
      onlyFromAccount: null,
      onlyInConversation: null,
      onlyLocal: null,
      onlyWithMedia: null,
      onlyNotMuted: null,
      excludeVisibilities: null,
      olderThanStatus: null,
      newerThanStatus: item,
      onlyNoNsfwSensitive: null,
      onlyNoReplies: null,
      limit: null,
      offset: null,
      orderingTermData: null,
      isFromHomeTimeline: null,
      onlyBookmarked: true,
      onlyFavourited: null,
    );
  }

  @override
  Future<bool> refreshItemsFromRemoteForPage({
    int limit,
    IStatus newerThan,
    IStatus olderThan,
  }) async {
    var remoteStatuses = await pleromaMyAccountService.getBookmarks(
      sinceId: newerThan?.remoteId,
      maxId: olderThan?.remoteId,
      limit: limit,
    );

    if (remoteStatuses != null) {
      await statusRepository.upsertRemoteStatuses(
        remoteStatuses,
        listRemoteId: null,
        conversationRemoteId: null,
      );

      return true;
    } else {
      _logger.severe(() => "error during refreshItemsFromRemoteForPage: "
          "accounts is null");
      return false;
    }
  }
}
