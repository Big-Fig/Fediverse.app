import 'package:fedi/app/chat/pleroma/post/pleroma_chat_post_message_bloc.dart';
import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:fedi/app/message/post_message_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PleromaChatPostMessageBlocProxyProvider extends StatelessWidget {
  final Widget child;

  PleromaChatPostMessageBlocProxyProvider({@required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IPleromaChatPostMessageBloc, IPostMessageBloc>(
      update: (context, value, previous) => value,
      child: PostMessageBlocProxyProvider(child: child),
    );
  }
}
