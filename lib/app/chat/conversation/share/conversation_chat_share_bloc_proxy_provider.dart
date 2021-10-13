import 'package:fedi/app/chat/conversation/share/conversation_chat_share_bloc.dart';
import 'package:fedi/app/share/to_account/share_to_account_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ConversationChatShareBlocProxyProvider extends StatelessWidget {
  final Widget child;

  ConversationChatShareBlocProxyProvider({required this.child});

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IConversationChatShareBloc, IShareToAccountBloc>(
        update: (context, value, previous) => value,
        child: child,
      );
}
