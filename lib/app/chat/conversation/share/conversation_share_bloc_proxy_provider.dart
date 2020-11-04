import 'package:fedi/app/chat/conversation/share/conversation_share_bloc.dart';
import 'package:fedi/app/share/message_input/share_message_input_bloc.dart';
import 'package:fedi/app/share/select/share_select_account_bloc.dart';
import 'package:fedi/app/share/share_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ConversationShareBlocProxyProvider extends StatelessWidget {
  final Widget child;

  ConversationShareBlocProxyProvider({@required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IConversationShareBloc, IShareBloc>(
      update: (context, value, previous) => value,
      child: ProxyProvider<IConversationShareBloc, IShareMessageInputBloc>(
        update: (context, value, previous) => value.shareMessageInputBloc,
        child: ProxyProvider<IConversationShareBloc, IShareSelectAccountBloc>(
            update: (context, value, previous) => value.shareSelectAccountBloc,
            child: child),
      ),
    );
  }
}
