import 'package:fedi/app/conversation/conversation_model.dart';
import 'package:fedi/app/conversation/status/list/cached/conversation_status_list_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("conversation_statuses_list_bloc_context_api_impl.dart");

class ConversationStatusListContextApiBloc extends ConversationStatusListBloc {
  final IPleromaStatusService pleromaStatusService;
  final IStatus statusToFetchContext;

  ConversationStatusListContextApiBloc(
      {@required this.pleromaStatusService,
      @required IConversation conversation,
      @required this.statusToFetchContext,
      @required IStatusRepository statusRepository})
      : super(conversation: conversation, statusRepository: statusRepository) {
    assert(statusToFetchContext != null);
  }

  @override
  IPleromaApi get pleromaApi => pleromaStatusService;

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required IStatus newerThan,
      @required IStatus olderThan}) async {
    _logger.fine(() => "start refreshItemsFromRemoteForPage \n"
        "\t conversation = $conversation"
        "\t newerThan = $newerThan"
        "\t olderThan = $olderThan");
    // newer pagination not supported
    assert(newerThan == null);

    if (olderThan != null) {
      // context don't support load more pagination
      return false;
    }
    try {
      var remoteContext = await pleromaStatusService.getStatusContext(
          statusRemoteId: statusToFetchContext.remoteId);

      var remoteStatuses = <PleromaStatus>[
        ...remoteContext.descendants,
        ...remoteContext.ancestors,
      ];

      if (remoteStatuses != null) {
        await statusRepository.upsertRemoteStatuses(remoteStatuses,
            listRemoteId: null, conversationRemoteId: conversation.remoteId);

        return true;
      } else {
        _logger.severe(() => "error during refreshItemsFromRemoteForPage: "
            "statuses is null");
        return false;
      }
    } catch (e, stackTrace) {
      _logger.severe(
          () => "error during refreshItemsFromRemoteForPage", e, stackTrace);
      return false;
    }
  }

  static ConversationStatusListContextApiBloc createFromContext(
          BuildContext context,
          {@required IConversation conversation,
          @required IStatus statusToFetchContext}) =>
      ConversationStatusListContextApiBloc(
          conversation: conversation,
          pleromaStatusService:
              IPleromaStatusService.of(context, listen: false),
          statusRepository: IStatusRepository.of(context, listen: false),
          statusToFetchContext: statusToFetchContext);
}
