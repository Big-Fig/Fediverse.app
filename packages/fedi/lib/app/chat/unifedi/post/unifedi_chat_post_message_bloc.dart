import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IUnifediChatPostMessageBloc implements IPostMessageBloc {
  static IUnifediChatPostMessageBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IUnifediChatPostMessageBloc>(
        context,
        listen: listen,
      );
}
