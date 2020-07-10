import 'package:fedi/app/home/tab/home_tab_bloc.dart';
import 'package:fedi/app/home/tab/home_tab_bloc_proxy_provider.dart';
import 'package:fedi/app/home/tab/messages/chat_messages_home_tab_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ChatMessagesHomeTabBlocProxyProvider extends StatelessWidget {
  final Widget child;

  ChatMessagesHomeTabBlocProxyProvider({@required this.child});

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IChatMessagesHomeTabBloc, IHomeTabBloc>(
        update: (context, value, previous) => value,
        child: HomeTabBlocProxyProvider(child: child),
      );
}
