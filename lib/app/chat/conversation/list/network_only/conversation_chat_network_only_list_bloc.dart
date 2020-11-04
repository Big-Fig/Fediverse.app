import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationChatNetworkOnlyListBloc extends DisposableOwner
    implements INetworkOnlyListBloc<IConversationChat> {
  static IConversationChatNetworkOnlyListBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IConversationChatNetworkOnlyListBloc>(context, listen: listen);
}
