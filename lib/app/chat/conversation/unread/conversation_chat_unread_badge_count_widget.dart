import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/ui/badge/fedi_bool_badge_widget.dart';
import 'package:flutter/cupertino.dart';

class ConversationChatUnreadBadgeCountWidget extends FediBoolBadgeWidget {
  const ConversationChatUnreadBadgeCountWidget({
    @required Widget child,
    double offset = 2.0,
  }) : super(child: child, offset: offset);

  @override
  Stream<bool> retrieveBoolStream(BuildContext context) {
    var chatRepository = IConversationChatRepository.of(context, listen: false);
    return chatRepository
        .watchTotalUnreadCount()
        .map((count) => count != null && count > 0);
  }
}
