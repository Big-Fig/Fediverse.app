import 'package:fedi/refactored/app/badge/badge_count_widget.dart';
import 'package:fedi/refactored/app/chat/repository/chat_repository.dart';
import 'package:flutter/cupertino.dart';

class ChatUnreadBadgeCountWidget extends BadgeCountWidget {
  ChatUnreadBadgeCountWidget({
    @required Widget child,
  }) : super(child: child);

  @override
  Stream<int> retrieveUnreadBadgeCountStream(BuildContext context) {
    var chatRepository = IChatRepository.of(context, listen: false);
    return chatRepository.watchTotalUnreadCount();
  }
}
