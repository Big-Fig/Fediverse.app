import 'package:fedi/app/chat/unifedi/post/unifedi_chat_post_message_bloc.dart';
import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:fedi/app/message/post_message_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class UnifediChatPostMessageBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const UnifediChatPostMessageBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IUnifediChatPostMessageBloc, IPostMessageBloc>(
        update: (context, value, previous) => value,
        child: PostMessageBlocProxyProvider(child: child),
      );
}
