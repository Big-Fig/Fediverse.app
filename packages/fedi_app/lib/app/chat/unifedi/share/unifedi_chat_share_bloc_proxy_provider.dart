import 'package:fedi_app/app/chat/unifedi/share/unifedi_chat_share_bloc.dart';
import 'package:fedi_app/app/share/to_account/share_to_account_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class UnifediChatShareBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const UnifediChatShareBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IUnifediChatShareBloc, IShareToAccountBloc>(
        update: (context, value, previous) => value,
        child: child,
      );
}
