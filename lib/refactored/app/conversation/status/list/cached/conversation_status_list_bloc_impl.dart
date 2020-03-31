import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/app/status/list/cached/status_cached_list_service.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/status/repository/status_repository_model.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("conversation_statuses_list_bloc_impl.dart");

abstract class ConversationStatusListService extends DisposableOwner
    implements IStatusCachedListService {
  final IStatusRepository statusRepository;
  final IConversation conversation;

  ConversationStatusListService(
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
        onlyNotMuted: null,
        excludeVisibilities: null,
        olderThanStatus: olderThan,
        newerThanStatus: newerThan,
        onlyNoNsfwSensitive: null,
        onlyNoReplies: null,
        limit: limit,
        offset: null,
        orderingTermData: StatusOrderingTermData(
            orderingMode: OrderingMode.desc,
            orderByType: StatusOrderByType.remoteId));

    _logger.finer(() =>
        "finish loadLocalItems for $conversation statuses ${statuses.length}");
    return statuses;
  }

  @override
  Future preRefreshAllAction() async {
    // nothing
  }
}
