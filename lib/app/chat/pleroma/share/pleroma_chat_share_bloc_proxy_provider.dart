import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_bloc.dart';
import 'package:fedi/app/share/message_input/share_message_input_bloc.dart';
import 'package:fedi/app/share/select/share_select_account_bloc.dart';
import 'package:fedi/app/share/share_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ChatShareBlocProxyProvider extends StatelessWidget {
  final Widget child;

  ChatShareBlocProxyProvider({@required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IChatShareBloc, IShareBloc>(
      update: (context, value, previous) => value,
      child: ProxyProvider<IChatShareBloc, IShareMessageInputBloc>(
        update: (context, value, previous) => value.shareMessageInputBloc,
        child: ProxyProvider<IChatShareBloc, IShareSelectAccountBloc>(
            update: (context, value, previous) => value.shareSelectAccountBloc,
            child: child),
      ),
    );
  }
}
