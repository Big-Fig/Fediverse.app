import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/list/cached/pleroma_chat_cached_list_bloc.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PleromaChatCachedListBlocProxyProvider extends StatelessWidget {
  final Widget child;

  PleromaChatCachedListBlocProxyProvider({@required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IPleromaChatCachedListBloc,
        IPleromaCachedListBloc<IPleromaChat>>(
      update: (context, value, previous) => value,
      child: child,
    );
  }
}
