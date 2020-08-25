import 'package:fedi/app/chat/chat_model.dart';
import 'package:fedi/app/chat/list/cached/chat_cached_list_bloc.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ChatCachedListBlocProxyProvider extends StatelessWidget {
  final Widget child;

  ChatCachedListBlocProxyProvider({@required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IChatCachedListBloc,
        IPleromaCachedListBloc<IChat>>(
      update: (context, value, previous) => value,
      child: child,
    );
  }
}
