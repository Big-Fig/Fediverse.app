import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository_model.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_model.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/repository/pleroma_chat_with_last_message_repository.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/repository/repository_model.dart';

class PleromaChatWithLastMessageRepository extends AsyncInitLoadingBloc
    implements IPleromaChatWithLastMessageRepository {
  final IPleromaChatRepository chatRepository;
  final IPleromaChatMessageRepository chatMessageRepository;

  PleromaChatWithLastMessageRepository({
    required this.chatRepository,
    required this.chatMessageRepository,
  });

  @override
  Future internalAsyncInit() async {
    // nothing by now
  }

  @override
  Future<List<IPleromaChatWithLastMessage>> getChatsWithLastMessage({
    required PleromaChatRepositoryFilters? filters,
    required RepositoryPagination<IPleromaChat> pagination,
    PleromaChatOrderingTermData orderingTermData =
        PleromaChatOrderingTermData.updatedAtDesc,
  }) async {
    var chats = await chatRepository.getChats(
      filters: filters,
      pagination: pagination,
      orderingTermData: orderingTermData,
    );

    return await _createChatWithLastMessageList(chats);
  }

  Future<List<PleromaChatWithLastMessageWrapper>>
      _createChatWithLastMessageList(
    List<DbPleromaChatPopulatedWrapper> chats,
  ) async {
    var chatLastMessagesMap =
        await chatMessageRepository.getChatsLastChatMessage(chats: chats);
    return chatLastMessagesMap.entries.map(
      (entry) {
        var chat = entry.key;
        var lastChatMessage = entry.value;
        return PleromaChatWithLastMessageWrapper(
          chat: chat,
          lastChatMessage: lastChatMessage,
        );
      },
    ).toList();
  }

  @override
  Stream<List<IPleromaChatWithLastMessage>> watchChatsWithLastMessage({
    required PleromaChatRepositoryFilters? filters,
    required RepositoryPagination<IPleromaChat> pagination,
    PleromaChatOrderingTermData orderingTermData =
        PleromaChatOrderingTermData.updatedAtDesc,
  }) {
    return chatRepository
        .watchChats(
          filters: filters,
          pagination: pagination,
          orderingTermData: orderingTermData,
        )
        .asyncMap(
          (chats) => _createChatWithLastMessageList(
            chats,
          ),
        );
  }
}
