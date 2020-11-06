import 'package:fedi/app/home/tab/chat/pleroma_chat_home_tab_bloc.dart';
import 'package:fedi/app/home/tab/home_tab_bloc.dart';
import 'package:fedi/app/home/tab/home_tab_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PleromaChatHomeTabBlocProxyProvider extends StatelessWidget {
  final Widget child;

  PleromaChatHomeTabBlocProxyProvider({@required this.child});

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IPleromaChatHomeTabBloc, IHomeTabBloc>(
        update: (context, value, previous) => value,
        child: HomeTabBlocProxyProvider(child: child),
      );
}
