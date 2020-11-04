import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_bloc.dart';
import 'package:fedi/app/share/message_input/share_message_input_bloc.dart';
import 'package:fedi/app/share/select/share_select_account_bloc.dart';
import 'package:fedi/app/share/share_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PleromaChatShareBlocProxyProvider extends StatelessWidget {
  final Widget child;

  PleromaChatShareBlocProxyProvider({@required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IPleromaChatShareBloc, IShareBloc>(
      update: (context, value, previous) => value,
      child: ProxyProvider<IPleromaChatShareBloc, IShareMessageInputBloc>(
        update: (context, value, previous) => value.shareMessageInputBloc,
        child: ProxyProvider<IPleromaChatShareBloc, IShareSelectAccountBloc>(
            update: (context, value, previous) => value.shareSelectAccountBloc,
            child: child),
      ),
    );
  }
}
