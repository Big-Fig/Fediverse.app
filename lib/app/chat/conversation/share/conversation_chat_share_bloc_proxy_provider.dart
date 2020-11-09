import 'package:fedi/app/chat/conversation/share/conversation_chat_share_bloc.dart';
import 'package:fedi/app/share/message_input/share_message_input_bloc.dart';
import 'package:fedi/app/share/select/share_select_account_bloc.dart';
import 'package:fedi/app/share/share_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ConversationChatShareBlocProxyProvider extends StatelessWidget {
  final Widget child;

  ConversationChatShareBlocProxyProvider({@required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IConversationChatShareBloc, IShareBloc>(
      update: (context, value, previous) => value,
      child: ProxyProvider<IConversationChatShareBloc, IShareMessageInputBloc>(
        update: (context, value, previous) => value.shareMessageInputBloc,
        child: ProxyProvider<IConversationChatShareBloc, IShareSelectAccountBloc>(
            update: (context, value, previous) => value.shareSelectAccountBloc,
            child: child),
      ),
    );
  }
}
