import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi_app/app/chat/settings/chat_settings_bloc.dart';
import 'package:fedi_app/app/chat/unifedi/repository/unifedi_chat_repository.dart';
import 'package:fedi_app/app/ui/badge/bool/fedi_bool_badge_bloc.dart';
import 'package:rxdart/rxdart.dart';

class ChatUnreadBadgeBloc extends DisposableOwner
    implements IFediBoolBadgeBloc {
  final IUnifediChatRepository unifediChatRepository;
  final IConversationChatRepository conversationChatRepository;
  final IChatSettingsBloc chatSettingsBloc;

  ChatUnreadBadgeBloc({
    required this.unifediChatRepository,
    required this.conversationChatRepository,
    required this.chatSettingsBloc,
  });

  @override
  Stream<bool> get badgeStream => Rx.combineLatest3(
        unifediChatRepository.watchTotalUnreadCount().map((count) => count > 0),
        conversationChatRepository
            .watchTotalUnreadCount()
            .map((count) => count > 0),
        chatSettingsBloc.countConversationsInChatsUnreadBadgesStream,
        (
          bool unifediUnread,
          bool conversationUnread,
          bool countConversationsUnread,
        ) =>
            unifediUnread || (conversationUnread && countConversationsUnread),
      );
}
