import 'package:fedi/app/chat/conversation/with_last_message/conversation_chat_with_last_message_model.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationChatWithLastMessageCachedBloc
    extends DisposableOwner
    implements IPleromaCachedListBloc<IConversationChatWithLastMessage> {
  static IConversationChatWithLastMessageCachedBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IConversationChatWithLastMessageCachedBloc>(context,
          listen: listen);

  Stream<List<IConversationChatWithLastMessage>> watchLocalItemsNewerThanItem(
      IConversationChatWithLastMessage item);
}
