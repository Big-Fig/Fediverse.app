import 'package:fedi/app/conversation/conversation_model.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("conversation_status_list_bloc_impl.dart");

abstract class ConversationStatusListBloc extends DisposableOwner
    implements IStatusCachedListBloc {
  final IStatusRepository statusRepository;
  final IConversation conversation;

  ConversationStatusListBloc(
      {@required this.conversation, @required this.statusRepository}) {
    assert(conversation != null);
  }

  @override
  Future<List<IStatus>> loadLocalItems(
      {@required int limit,
      @required IStatus newerThan,
      @required IStatus olderThan}) async {
    _logger.finest(() => "start loadLocalItems \n"
        "\t newerThan=$newerThan"
        "\t olderThan=$olderThan");

    var statuses = await statusRepository.getStatuses(
      onlyInConversation: conversation,
      onlyFromAccount: null,
      onlyInListWithRemoteId: null,
      onlyWithHashtag: null,
      onlyFromAccountsFollowingByAccount: null,
      onlyLocal: null,
      onlyWithMedia: null,
      withMuted: null,
      excludeVisibilities: null,
      olderThanStatus: olderThan,
      newerThanStatus: newerThan,
      onlyNoNsfwSensitive: null,
      onlyNoReplies: null,
      limit: limit,
      offset: null,
      orderingTermData: StatusOrderingTermData(
          orderingMode: OrderingMode.desc,
          orderByType: StatusOrderByType.remoteId),
      isFromHomeTimeline: null,
      onlyBookmarked: null,
      onlyFavourited: null,
    );

    _logger.finer(() =>
        "finish loadLocalItems for $conversation statuses ${statuses.length}");
    return statuses;
  }

  @override
  Stream<List<IStatus>> watchLocalItemsNewerThanItem(IStatus item) {
    return statusRepository.watchStatuses(
      onlyInConversation: conversation,
      onlyFromAccount: null,
      onlyInListWithRemoteId: null,
      onlyWithHashtag: null,
      onlyFromAccountsFollowingByAccount: null,
      onlyLocal: null,
      onlyWithMedia: null,
      withMuted: null,
      excludeVisibilities: null,
      olderThanStatus: null,
      newerThanStatus: item,
      onlyNoNsfwSensitive: null,
      onlyNoReplies: null,
      limit: null,
      offset: null,
      orderingTermData: StatusOrderingTermData(
          orderingMode: OrderingMode.desc,
          orderByType: StatusOrderByType.remoteId),
      isFromHomeTimeline: null,
      onlyBookmarked: null,
      onlyFavourited: null,
    );
  }
}
