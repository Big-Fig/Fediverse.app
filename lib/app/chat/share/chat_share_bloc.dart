import 'package:fedi/app/share/message_input/share_message_input_bloc.dart';
import 'package:fedi/app/share/to_account/share_to_account_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatShareBloc extends IShareToAccountBloc {
  static IChatShareBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IChatShareBloc>(context, listen: listen);

  IShareMessageInputBloc get shareMessageInputBloc;
}
