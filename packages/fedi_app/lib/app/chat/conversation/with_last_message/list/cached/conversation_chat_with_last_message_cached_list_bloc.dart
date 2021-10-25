import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/chat/conversation/with_last_message/conversation_chat_with_last_message_model.dart';
import 'package:fedi_app/app/list/cached/unifedi_cached_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationChatWithLastMessageCachedListBloc
    extends DisposableOwner
    implements ICachedListBloc<IConversationChatWithLastMessage> {
  static IConversationChatWithLastMessageCachedListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IConversationChatWithLastMessageCachedListBloc>(
        context,
        listen: listen,
      );

  Stream<List<IConversationChatWithLastMessage>> watchLocalItemsNewerThanItem(
    IConversationChatWithLastMessage? item,
  );
}
