import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaChatPostMessageBloc implements IPostMessageBloc {
  static IPleromaChatPostMessageBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPleromaChatPostMessageBloc>(context, listen: listen);
}
