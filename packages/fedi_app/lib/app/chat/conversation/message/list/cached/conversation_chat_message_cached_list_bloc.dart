import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/chat/conversation/message/conversation_chat_message_model.dart';
import 'package:fedi_app/app/list/cached/unifedi_cached_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationChatMessageCachedListBloc
    implements IDisposable, ICachedListBloc<IConversationChatMessage> {
  static IConversationChatMessageCachedListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IConversationChatMessageCachedListBloc>(
        context,
        listen: listen,
      );

  Stream<List<IConversationChatMessage>> watchLocalItemsNewerThanItem(
    IConversationChatMessage? item,
  );
}
