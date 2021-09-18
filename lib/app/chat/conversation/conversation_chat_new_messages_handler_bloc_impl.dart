import 'package:fedi/app/chat/conversation/conversation_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/conversation/current/conversation_chat_current_bloc.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:unifedi_api/unifedi_api.dart';

class ConversationChatNewMessagesHandlerBloc extends DisposableOwner
    implements IConversationChatNewMessagesHandlerBloc {
  final IUnifediApiConversationService conversationChatService;
  final IConversationChatRepository conversationRepository;
  final IConversationChatCurrentBloc currentChatBloc;

  ConversationChatNewMessagesHandlerBloc({
    required this.conversationChatService,
    required this.conversationRepository,
    required this.currentChatBloc,
  });

  @override
  Future handleChatUpdate(IUnifediApiConversation conversation) async {
    var conversationRemoteId = conversation.id;
    var isMessageForOpenedChat =
        currentChatBloc.currentChat?.remoteId == conversationRemoteId;

    if (isMessageForOpenedChat) {
      conversation = await conversationChatService.markConversationAsRead(
        conversationRemoteId: conversationRemoteId,
      );
    }

    if (conversation.accounts.isEmpty) {
      // sometimes accounts is empty
      // but if we fetch conversation by ID it will have accounts
      // usually it happens when user just started new conversation
      if (conversationChatService.isPleroma) {
        await _updateConversationById(conversationRemoteId);
      } else {
        if (conversation.lastStatus != null) {
          conversation = conversation.toUnifediApiConversation().copyWith(
            accounts: [
              conversation.lastStatus!.account.toUnifediApiAccount(),
            ],
          );
        }
        await conversationRepository.upsertInRemoteType(
          conversation,
        );
      }
    } else {
      await conversationRepository.upsertInRemoteType(
        conversation,
      );
    }
  }

  Future _updateConversationById(String conversationRemoteId) async {
    var conversation = await conversationChatService.getConversation(
      conversationRemoteId: conversationRemoteId,
    );

    await conversationRepository.upsertInRemoteType(
      conversation,
    );
  }
}
