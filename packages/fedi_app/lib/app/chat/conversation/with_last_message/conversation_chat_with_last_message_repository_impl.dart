import 'package:fedi_app/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi_app/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi_app/app/chat/conversation/repository/conversation_chat_repository_model.dart';
import 'package:fedi_app/app/chat/conversation/with_last_message/conversation_chat_with_last_message_model.dart';
import 'package:fedi_app/app/chat/conversation/with_last_message/conversation_chat_with_last_message_repository.dart';
import 'package:fedi_app/app/status/repository/status_repository.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi_app/repository/repository_model.dart';

class ConversationChatWithLastMessageRepository extends AsyncInitLoadingBloc
    implements IConversationChatWithLastMessageRepository {
  final IConversationChatRepository conversationChatRepository;
  final IStatusRepository statusRepository;

  ConversationChatWithLastMessageRepository({
    required this.conversationChatRepository,
    required this.statusRepository,
  });

  @override
  // ignore: no-empty-block
  Future<void> internalAsyncInit() async {
    // nothing by now
  }

  @override
  Future<List<IConversationChatWithLastMessage>>
      getConversationsWithLastMessage({
    required ConversationChatRepositoryFilters? filters,
    required RepositoryPagination<IConversationChat> pagination,
    ConversationRepositoryChatOrderingTermData orderingTermData =
        ConversationRepositoryChatOrderingTermData.updatedAtDesc,
  }) =>
          conversationChatRepository.getConversationsWithLastMessage(
            filters: filters,
            pagination: pagination,
            orderingTermData: orderingTermData,
          );

  @override
  Stream<List<IConversationChatWithLastMessage>>
      watchConversationsWithLastMessage({
    required ConversationChatRepositoryFilters? filters,
    required RepositoryPagination<IConversationChat> pagination,
    ConversationRepositoryChatOrderingTermData orderingTermData =
        ConversationRepositoryChatOrderingTermData.updatedAtDesc,
  }) =>
          conversationChatRepository.watchConversationsWithLastMessage(
            filters: filters,
            pagination: pagination,
            orderingTermData: orderingTermData,
          );
}
