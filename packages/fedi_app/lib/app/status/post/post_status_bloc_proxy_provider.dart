import 'package:fedi_app/app/message/post_message_bloc.dart';
import 'package:fedi_app/app/message/post_message_bloc_proxy_provider.dart';
import 'package:fedi_app/app/status/post/poll/post_status_poll_bloc.dart';
import 'package:fedi_app/app/status/post/post_status_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PostStatusMessageBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const PostStatusMessageBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IPostStatusBloc, IPostMessageBloc>(
        update: (context, value, previous) => value,
        child: ProxyProvider<IPostStatusBloc, IPostStatusPollBloc>(
          update: (context, value, previous) => value.pollBloc,
          child: PostMessageBlocProxyProvider(child: child),
        ),
      );
}
