import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/chat/conversation/conversation_chat_new_messages_handler_bloc.dart';
import 'package:fedi_app/app/chat/conversation/current/conversation_chat_current_bloc.dart';
import 'package:fedi_app/app/chat/conversation/repository/conversation_chat_repository.dart';
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
  Future<void> handleChatUpdate(IUnifediApiConversation conversation) async {
    var conversationRemoteId = conversation.id;
    var isMessageForOpenedChat =
        currentChatBloc.currentChat?.remoteId == conversationRemoteId;

    var actualConversation = conversation;
    if (isMessageForOpenedChat) {
      actualConversation = await conversationChatService.markConversationAsRead(
        conversationId: conversationRemoteId,
      );
    }

    if (actualConversation.accounts.isEmpty) {
      // sometimes accounts is empty
      // but if we fetch conversation by ID it will have accounts
      // usually it happens when user just started new conversation
      if (conversationChatService.isPleroma) {
        await _updateConversationById(conversationRemoteId);
      } else {
        if (conversation.lastStatus != null) {
          actualConversation =
              actualConversation.toUnifediApiConversation().copyWith(
            accounts: [
              actualConversation.lastStatus!.account.toUnifediApiAccount(),
            ],
          );
        }
        // ignore: avoid-ignoring-return-values
        await conversationRepository.upsertInRemoteType(
          actualConversation,
        );
      }
    } else {
      // ignore: avoid-ignoring-return-values
      await conversationRepository.upsertInRemoteType(
        actualConversation,
      );
    }
  }

  Future<void> _updateConversationById(String conversationRemoteId) async {
    var conversation = await conversationChatService.getConversation(
      conversationId: conversationRemoteId,
    );

    // ignore: avoid-ignoring-return-values
    await conversationRepository.upsertInRemoteType(
      conversation,
    );
  }
}
