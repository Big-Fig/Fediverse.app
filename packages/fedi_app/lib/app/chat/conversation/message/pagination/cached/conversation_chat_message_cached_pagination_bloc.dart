import 'package:fedi_app/app/chat/conversation/message/conversation_chat_message_model.dart';
import 'package:fedi_app/app/pagination/cached/cached_unifedi_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationChatMessageCachedPaginationBloc
    implements ICachedUnifediPaginationBloc<IConversationChatMessage> {
  static IConversationChatMessageCachedPaginationBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IConversationChatMessageCachedPaginationBloc>(
        context,
        listen: listen,
      );
}
