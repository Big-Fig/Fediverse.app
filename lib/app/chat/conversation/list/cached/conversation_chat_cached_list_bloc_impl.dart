import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/list/cached/conversation_chat_cached_list_bloc.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_model.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor_flutter/moor_flutter.dart';

var _logger = Logger("conversation_chat_cached_list_bloc_impl.dart");

class ConversationChatCachedListBloc extends IConversationChatCachedListBloc {
  final IPleromaConversationService pleromaConversationService;
  final IConversationChatRepository conversationRepository;

  ConversationChatCachedListBloc(
      {@required this.pleromaConversationService,
      @required this.conversationRepository});

  @override
  IPleromaApi get pleromaApi => pleromaConversationService;

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required IConversationChat newerThan,
      @required IConversationChat olderThan}) async {
    _logger.fine(() => "start refreshItemsFromRemoteForPage \n"
        "\t newerThan = $newerThan"
        "\t olderThan = $olderThan");

    List<IPleromaConversation> remoteConversations;

    remoteConversations = await pleromaConversationService.getConversations(
        maxId: olderThan?.remoteId, sinceId: newerThan?.remoteId, limit: limit);

    if (remoteConversations != null) {
      await conversationRepository
          .upsertRemoteConversations(remoteConversations);

      return true;
    } else {
      _logger.severe(() => "error during refreshItemsFromRemoteForPage: "
          "conversations is null");
      return false;
    }
  }

  @override
  Future<List<IConversationChat>> loadLocalItems(
      {@required int limit,
      @required IConversationChat newerThan,
      @required IConversationChat olderThan}) async {
    _logger.finest(() => "start loadLocalItems \n"
        "\t newerThan=$newerThan"
        "\t olderThan=$olderThan");

    var conversations = await conversationRepository.getConversations(
      olderThan: olderThan,
      newerThan: newerThan,
      limit: limit,
      offset: null,
      orderingTermData: ConversationChatOrderingTermData(
        orderingMode: OrderingMode.desc,
        orderByType: ConversationPleromaChatOrderByType.updatedAt,
      ),
    );

    _logger.finer(
        () => "finish loadLocalItems conversations ${conversations.length}");
    return conversations;
  }

  @override
  Stream<List<IConversationChat>> watchLocalItemsNewerThanItem(
          IConversationChat item) =>
      conversationRepository.watchConversations(
        olderThan: null,
        newerThan: item,
        limit: null,
        offset: null,
        orderingTermData: ConversationChatOrderingTermData(
          orderingMode: OrderingMode.desc,
          orderByType: ConversationPleromaChatOrderByType.updatedAt,
        ),
      );
}
