import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ChatMessageListItem<T extends IChatMessage> {
  static ChatMessageListItem<T> of<T extends IChatMessage>(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ChatMessageListItem<T>>(context, listen: listen);

  final T message;
  final bool isFirstInMinuteGroup;
  final bool isLastInMinuteGroup;

  final bool isFirstInDayGroup;
  final bool isLastInDayGroup;

  ChatMessageListItem({
    @required this.message,
    @required this.isFirstInMinuteGroup,
    @required this.isLastInMinuteGroup,
    @required this.isFirstInDayGroup,
    @required this.isLastInDayGroup,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatMessageListItem &&
          runtimeType == other.runtimeType &&
          message == other.message &&
          isFirstInMinuteGroup == other.isFirstInMinuteGroup &&
          isLastInMinuteGroup == other.isLastInMinuteGroup &&
          isFirstInDayGroup == other.isFirstInDayGroup &&
          isLastInDayGroup == other.isLastInDayGroup;
  @override
  int get hashCode =>
      message.hashCode ^
      isFirstInMinuteGroup.hashCode ^
      isLastInMinuteGroup.hashCode ^
      isFirstInDayGroup.hashCode ^
      isLastInDayGroup.hashCode;
  @override
  String toString() {
    return 'ChatMessageListItem{message: $message,'
        ' isFirstInMinuteGroup: $isFirstInMinuteGroup,'
        ' isLastInMinuteGroup: $isLastInMinuteGroup,'
        ' isFirstInDayGroup: $isFirstInDayGroup,'
        ' isLastInDayGroup: $isLastInDayGroup}';
  }
}
