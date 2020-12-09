import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/chat/settings/chat_settings_bloc.dart';
import 'package:fedi/app/ui/badge/fedi_bool_badge_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class ChatUnreadBadgeCountWidget extends FediBoolBadgeWidget {
  const ChatUnreadBadgeCountWidget({
    @required Widget child,
    double offset = 2.0,
  }) : super(child: child, offset: offset);

  @override
  Stream<bool> retrieveBoolStream(BuildContext context) {
    var conversationChatRepository =
        IConversationChatRepository.of(context, listen: false);
    var pleromaChatRepository =
        IPleromaChatRepository.of(context, listen: false);
    var chatSettingsBloc = IChatSettingsBloc.of(context, listen: false);

    return Rx.combineLatest3(
        pleromaChatRepository
            .watchTotalUnreadCount()
            .map((count) => count != null && count > 0),
        conversationChatRepository
            .watchTotalUnreadCount()
            .map((count) => count != null && count > 0),
        chatSettingsBloc.countConversationsInChatsUnreadBadgesStream,
        (pleromaUnread, conversationUnread, countConversationsUnread) =>
            pleromaUnread || (conversationUnread && countConversationsUnread));
  }
}
