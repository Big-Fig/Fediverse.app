import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/ui/badge/bool/fedi_bool_badge_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';

class ConversationChatUnreadBadgeBloc extends DisposableOwner
    implements IFediBoolBadgeBloc {
  final IConversationChatRepository conversationChatRepository;

  ConversationChatUnreadBadgeBloc({
    @required this.conversationChatRepository,
  });

  @override
  Stream<bool> get badgeStream =>
      conversationChatRepository
          .watchTotalUnreadCount()
          .map((count) => count != null && count > 0);
}
