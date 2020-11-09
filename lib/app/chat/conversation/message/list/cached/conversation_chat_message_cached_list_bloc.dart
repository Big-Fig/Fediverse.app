import 'package:fedi/app/chat/conversation/message/conversation_chat_message_model.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationChatMessageCachedListBloc
    implements IDisposable, IPleromaCachedListBloc<IConversationChatMessage> {
  static IConversationChatMessageCachedListBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IConversationChatMessageCachedListBloc>(context,
          listen: listen);

  Stream<List<IConversationChatMessage>> watchLocalItemsNewerThanItem(
      IConversationChatMessage item);
}
