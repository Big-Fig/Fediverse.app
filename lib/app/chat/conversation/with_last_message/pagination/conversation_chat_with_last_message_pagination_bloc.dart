import 'package:fedi/app/chat/conversation/with_last_message/conversation_chat_with_last_message_model.dart';
import 'package:fedi/app/pagination/cached/cached_pleroma_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationChatWithLastMessagePaginationBloc
    implements ICachedPleromaPaginationBloc<IConversationChatWithLastMessage> {
  static IConversationChatWithLastMessagePaginationBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IConversationChatWithLastMessagePaginationBloc>(
        context,
        listen: listen,
      );
}
