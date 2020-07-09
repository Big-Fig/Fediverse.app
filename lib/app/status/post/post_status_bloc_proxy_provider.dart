import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:fedi/app/message/post_message_bloc_proxy_provider.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PostStatusMessageBlocProxyProvider extends StatelessWidget {
  final Widget child;

  PostStatusMessageBlocProxyProvider({@required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IPostStatusBloc, IPostMessageBloc>(
      update: (context, value, previous) => value,
      child: PostMessageBlocProxyProvider(child: child),
    );
  }
}
