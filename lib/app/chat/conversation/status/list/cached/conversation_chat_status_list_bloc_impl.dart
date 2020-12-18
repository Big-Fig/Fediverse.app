import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/status/list/cached/conversation_chat_status_list_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("conversation_chat_status_list_bloc_impl.dart");

abstract class ConversationChatStatusListBloc extends AsyncInitLoadingBloc
    implements IConversationChatStatusCachedListBloc {
  final IStatusRepository statusRepository;
  final IConversationChat conversation;

  ConversationChatStatusListBloc(
      {@required this.conversation, @required this.statusRepository}) {
    assert(conversation != null);
  }

  @override
  Future internalAsyncInit() async {
    // nothing
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
      onlyLocalCondition: null,
      onlyWithMedia: null,
      withMuted: null,
      excludeVisibilities: null,
      olderThanStatus: olderThan,
      newerThanStatus: newerThan,
      onlyNoNsfwSensitive: null,
      onlyNoReplies: null,
      limit: limit,
      offset: null,
      orderingTermData: StatusRepositoryOrderingTermData(
          orderingMode: OrderingMode.desc,
          orderType: StatusRepositoryOrderType.remoteId),
      isFromHomeTimeline: null,
      onlyBookmarked: null,
      onlyFavourited: null,
      excludeTextConditions: null,
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
      onlyLocalCondition: null,
      onlyWithMedia: null,
      withMuted: null,
      excludeVisibilities: null,
      olderThanStatus: null,
      newerThanStatus: item,
      onlyNoNsfwSensitive: null,
      onlyNoReplies: null,
      limit: null,
      offset: null,
      orderingTermData: StatusRepositoryOrderingTermData(
          orderingMode: OrderingMode.desc,
          orderType: StatusRepositoryOrderType.remoteId),
      isFromHomeTimeline: null,
      onlyBookmarked: null,
      onlyFavourited: null,
      excludeTextConditions: null,
    );
  }
}
