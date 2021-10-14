import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_bloc.dart';
import 'package:fedi/app/share/to_account/share_to_account_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PleromaChatShareBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const PleromaChatShareBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IPleromaChatShareBloc, IShareToAccountBloc>(
        update: (context, value, previous) => value,
        child: child,
      );
}
