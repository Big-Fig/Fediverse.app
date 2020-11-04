import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatPostMessageBloc implements IPostMessageBloc {
  static IChatPostMessageBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IChatPostMessageBloc>(context, listen: listen);
}
