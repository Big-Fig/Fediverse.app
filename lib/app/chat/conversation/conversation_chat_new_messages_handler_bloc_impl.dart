import 'package:fedi/app/chat/conversation/conversation_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/conversation/current/conversation_chat_current_bloc.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/conversation/pleroma_conversation_model.dart';
import 'package:fedi/pleroma/api/conversation/pleroma_conversation_service.dart';

class ConversationChatNewMessagesHandlerBloc extends DisposableOwner
    implements IConversationChatNewMessagesHandlerBloc {
  final IPleromaConversationService conversationChatService;
  final IConversationChatRepository conversationRepository;
  final IConversationChatCurrentBloc currentChatBloc;

  ConversationChatNewMessagesHandlerBloc({
    required this.conversationChatService,
    required this.conversationRepository,
    required this.currentChatBloc,
  });

  @override
  Future handleChatUpdate(IPleromaConversation conversation) async {
    var conversationRemoteId = conversation.id;
    var isMessageForOpenedChat =
        currentChatBloc.currentChat?.remoteId == conversationRemoteId;

    if (isMessageForOpenedChat) {
      conversation = await conversationChatService.markConversationAsRead(
        conversationRemoteId: conversationRemoteId,
      );
    }

    return conversationRepository.upsertInRemoteType(
      conversation,
    );
  }
}
