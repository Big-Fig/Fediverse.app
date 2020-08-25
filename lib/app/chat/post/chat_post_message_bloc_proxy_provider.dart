import 'package:fedi/app/chat/post/chat_post_message_bloc.dart';
import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:fedi/app/message/post_message_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ChatPostMessageBlocProxyProvider extends StatelessWidget {
  final Widget child;

  ChatPostMessageBlocProxyProvider({@required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IChatPostMessageBloc, IPostMessageBloc>(
      update: (context, value, previous) => value,
      child: PostMessageBlocProxyProvider(child: child),
    );
  }
}
