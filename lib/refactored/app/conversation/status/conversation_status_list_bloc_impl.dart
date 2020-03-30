import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/pleroma/conversation/pleroma_conversation_service.dart';
import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/app/status/list/status_list_service.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/status/repository/status_repository_model.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("conversation_statuses_list_bloc_impl.dart");

abstract class ConversationStatusListService extends DisposableOwner
    implements IStatusListService {

  final IStatusRepository statusRepository;
  final IConversation conversation;

  ConversationStatusListService(
      {@required this.conversation,
      @required this.statusRepository}) {
    assert(conversation != null);
  }


  @override
  Future<List<IStatus>> loadLocalItems(
      {@required int limit,
      @required IStatus newerThanStatus,
      @required IStatus olderThanStatus}) async {
    _logger.finest(() => "start loadLocalItems \n"
        "\t newerThanStatus=$newerThanStatus"
        "\t olderThanStatus=$olderThanStatus");

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
        olderThanStatus: olderThanStatus,
        newerThanStatus: newerThanStatus,
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
