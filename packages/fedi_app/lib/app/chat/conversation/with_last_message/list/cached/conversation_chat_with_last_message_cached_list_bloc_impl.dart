import 'package:fedi_app/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi_app/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi_app/app/chat/conversation/repository/conversation_chat_repository_model.dart';
import 'package:fedi_app/app/chat/conversation/with_last_message/conversation_chat_with_last_message_model.dart';
import 'package:fedi_app/app/chat/conversation/with_last_message/conversation_chat_with_last_message_repository.dart';
import 'package:fedi_app/app/chat/conversation/with_last_message/list/cached/conversation_chat_with_last_message_cached_list_bloc.dart';
import 'package:fedi_app/repository/repository_model.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger =
    Logger('unifedi_chat_with_last_message_cached_list_bloc_impl.dart');

class ConversationChatWithLastMessageCachedListBloc
    extends IConversationChatWithLastMessageCachedListBloc {
  final IUnifediApiConversationService conversationChatService;
  final IConversationChatRepository conversationRepository;
  final IConversationChatWithLastMessageRepository
      chatWithLastMessageRepository;

  ConversationChatWithLastMessageCachedListBloc({
    required this.conversationChatService,
    required this.conversationRepository,
    required this.chatWithLastMessageRepository,
  });

  @override
  IUnifediApiService get unifediApi => conversationChatService;

  @override
  Future<void> refreshItemsFromRemoteForPage({
    required int? limit,
    required IConversationChatWithLastMessage? newerThan,
    required IConversationChatWithLastMessage? olderThan,
  }) async {
    _logger.fine(
      () => 'start refreshItemsFromRemoteForPage \n'
          '\t newerThan = $newerThan'
          '\t olderThan = $olderThan',
    );

    List<IUnifediApiConversation>? remoteConversations;

    remoteConversations = await conversationChatService.getConversations(
      pagination: UnifediApiPagination(
        maxId: olderThan?.chat.remoteId,
        minId: newerThan?.chat.remoteId,
        limit: limit,
      ),
      recipientsIds: null,
    );

    await conversationRepository.upsertAllInRemoteType(
      remoteConversations,
      batchTransaction: null,
    );
  }

  @override
  Future<List<IConversationChatWithLastMessage>> loadLocalItems({
    required int? limit,
    required IConversationChatWithLastMessage? newerThan,
    required IConversationChatWithLastMessage? olderThan,
  }) async {
    _logger.finest(
      () => 'start loadLocalItems \n'
          '\t newerThan=$newerThan'
          '\t olderThan=$olderThan',
    );

    var chats =
        await chatWithLastMessageRepository.getConversationsWithLastMessage(
      filters: null,
      pagination: RepositoryPagination<IConversationChat>(
        olderThanItem: olderThan?.chat,
        newerThanItem: newerThan?.chat,
        limit: limit,
      ),
      orderingTermData:
          ConversationRepositoryChatOrderingTermData.updatedAtDesc,
    );

    _logger.finer(() => 'finish loadLocalItems chats ${chats.length}');

    return chats;
  }

  @override
  Stream<List<IConversationChatWithLastMessage>> watchLocalItemsNewerThanItem(
    IConversationChatWithLastMessage? item,
  ) =>
      chatWithLastMessageRepository.watchConversationsWithLastMessage(
        filters: null,
        pagination: RepositoryPagination<IConversationChat>(
          newerThanItem: item?.chat,
        ),
        orderingTermData:
            ConversationRepositoryChatOrderingTermData.updatedAtDesc,
      );
}
