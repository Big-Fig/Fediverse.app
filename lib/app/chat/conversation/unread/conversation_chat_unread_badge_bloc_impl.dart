import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/ui/badge/bool/fedi_bool_badge_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';

class ConversationChatUnreadBadgeBloc extends DisposableOwner
    implements IFediBoolBadgeBloc {
  final IConversationChatRepository conversationChatRepository;

  ConversationChatUnreadBadgeBloc({
    required this.conversationChatRepository,
  });

  @override
  Stream<bool> get badgeStream =>
      conversationChatRepository
          .watchTotalUnreadCount()
          .map((count) => count > 0);
}
