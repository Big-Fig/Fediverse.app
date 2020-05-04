import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/app/conversation/list/conversation_list_service.dart';
import 'package:fedi/refactored/app/conversation/repository/conversation_repository.dart';
import 'package:fedi/refactored/app/conversation/repository/conversation_repository_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/pleroma/conversation/pleroma_conversation_model.dart';
import 'package:fedi/refactored/pleroma/conversation/pleroma_conversation_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("conversation_list_service_impl.dart.dart");

class ConversationListService extends DisposableOwner
    implements IConversationListService {
  final IPleromaConversationService pleromaConversationService;
  final IConversationRepository conversationRepository;

  ConversationListService(
      {@required this.pleromaConversationService,
      @required this.conversationRepository});

  @override
  IPleromaApi get pleromaApi => pleromaConversationService;

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required IConversation newerThanConversation,
      @required IConversation olderThanConversation}) async {
    _logger.fine(() => "start refreshItemsFromRemoteForPage \n"
        "\t newerThanConversation = $newerThanConversation"
        "\t olderThanConversation = $olderThanConversation");

    try {
      List<IPleromaConversation> remoteConversations;

      remoteConversations = await pleromaConversationService.getConversations(
          maxId: olderThanConversation?.remoteId,
          sinceId: newerThanConversation?.remoteId,
          limit: limit);

      if (remoteConversations != null) {
        await conversationRepository
            .upsertRemoteConversations(remoteConversations);

        return true;
      } else {
        _logger.severe(() => "error during refreshItemsFromRemoteForPage: "
            "conversations is null");
        return false;
      }
    } catch (e, stackTrace) {
      _logger.severe(
          () => "error during refreshItemsFromRemoteForPage", e, stackTrace);
      return false;
    }
  }

  @override
  Future<List<IConversation>> loadLocalItems(
      {@required int limit,
      @required IConversation newerThanConversation,
      @required IConversation olderThanConversation}) async {
    _logger.finest(() => "start loadLocalItems \n"
        "\t newerThanConversation=$newerThanConversation"
        "\t olderThanConversation=$olderThanConversation");

    var conversations = await conversationRepository.getConversations(
        olderThanConversation: olderThanConversation,
        newerThanConversation: newerThanConversation,
        limit: limit,
        offset: null,
        orderingTermData: ConversationOrderingTermData(
            orderingMode: OrderingMode.desc,
            orderByType: ConversationOrderByType.remoteId));

    _logger.finer(
        () => "finish loadLocalItems conversations ${conversations.length}");
    return conversations;
  }
}
