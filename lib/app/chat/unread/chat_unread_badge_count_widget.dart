import 'package:fedi/app/badge/badge_count_widget.dart';
import 'package:fedi/app/chat/repository/chat_repository.dart';
import 'package:flutter/cupertino.dart';

class ChatUnreadBadgeCountWidget extends BadgeCountWidget {
  const ChatUnreadBadgeCountWidget({
    @required Widget child,
  }) : super(child: child);

  @override
  Stream<int> retrieveUnreadBadgeCountStream(BuildContext context) {
    var chatRepository = IChatRepository.of(context, listen: false);
    return chatRepository.watchTotalUnreadCount();
  }
}
