import 'package:fedi/app/chat/conversation/conversation_model.dart';
import 'package:fedi/app/chat/conversation/status/list/cached/conversation_status_list_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger =
    Logger("conversation_status_list_conversation_api_bloc_impl.dart");

class ConversationStatusListConversationApiBloc
    extends ConversationStatusListBloc {
  final IPleromaConversationService pleromaConversationService;

  ConversationStatusListConversationApiBloc(
      {@required IConversation conversation,
      @required this.pleromaConversationService,
      @required IStatusRepository statusRepository})
      : super(conversation: conversation, statusRepository: statusRepository);

  @override
  IPleromaApi get pleromaApi => pleromaConversationService;

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required IStatus newerThan,
      @required IStatus olderThan}) async {
    _logger.fine(() => "start refreshItemsFromRemoteForPage \n"
        "\t conversation = $conversation"
        "\t newerThan = $newerThan"
        "\t olderThan = $olderThan");

    var remoteStatuses =
        await pleromaConversationService.getConversationStatuses(
            conversationRemoteId: conversation.remoteId,
            maxId: olderThan?.remoteId,
            sinceId: newerThan?.remoteId,
            limit: limit);

    if (remoteStatuses != null) {
      await statusRepository.upsertRemoteStatuses(remoteStatuses,
          listRemoteId: null, conversationRemoteId: conversation.remoteId);

      return true;
    } else {
      _logger.severe(() => "error during refreshItemsFromRemoteForPage: "
          "statuses is null");
      return false;
    }
  }

  static ConversationStatusListConversationApiBloc createFromContext(
          BuildContext context,
          {@required IConversation conversation}) =>
      ConversationStatusListConversationApiBloc(
          conversation: conversation,
          pleromaConversationService:
              IPleromaConversationService.of(context, listen: false),
          statusRepository: IStatusRepository.of(context, listen: false));

  @override
  Stream<bool> get settingsChangedStream => Stream.empty();
}
