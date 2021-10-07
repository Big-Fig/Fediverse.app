import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider/provider.dart';

part 'chat_message_list_item_model.freezed.dart';

@freezed
class ChatMessageListItem<T extends IChatMessage>
    with _$ChatMessageListItem<T> {
  static ChatMessageListItem<T> of<T extends IChatMessage>(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ChatMessageListItem<T>>(context, listen: listen);

  const factory ChatMessageListItem({
    required T message,
    required bool isFirstInMinuteGroup,
    required bool isLastInMinuteGroup,
    required bool isFirstInDayGroup,
    required bool isLastInDayGroup,
  }) = _ChatMessageListItem<T>;
}
