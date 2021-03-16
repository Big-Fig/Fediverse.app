import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/chat/settings/chat_settings_bloc.dart';
import 'package:fedi/app/ui/badge/bool/fedi_bool_badge_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:rxdart/rxdart.dart';

class ChatUnreadBadgeBloc extends DisposableOwner
    implements IFediBoolBadgeBloc {
  final IPleromaChatRepository pleromaChatRepository;
  final IConversationChatRepository conversationChatRepository;
  final IChatSettingsBloc chatSettingsBloc;

  ChatUnreadBadgeBloc({
    required this.pleromaChatRepository,
    required this.conversationChatRepository,
    required this.chatSettingsBloc,
  });

  @override
  Stream<bool> get badgeStream => Rx.combineLatest3(
        pleromaChatRepository
            .watchTotalUnreadCount()
            .map((count) => count != null && count > 0),
        conversationChatRepository
            .watchTotalUnreadCount()
            .map((count) => count != null && count > 0),
        chatSettingsBloc.countConversationsInChatsUnreadBadgesStream,
        (dynamic pleromaUnread, dynamic conversationUnread, dynamic countConversationsUnread) =>
            pleromaUnread || (conversationUnread && countConversationsUnread),
      );
}
