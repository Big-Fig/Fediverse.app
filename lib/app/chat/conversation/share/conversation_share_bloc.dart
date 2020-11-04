import 'package:fedi/app/share/message_input/share_message_input_bloc.dart';
import 'package:fedi/app/share/to_account/share_to_account_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationShareBloc extends IShareToAccountBloc {
  static IConversationShareBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IConversationShareBloc>(context, listen: listen);

  IShareMessageInputBloc get shareMessageInputBloc;
}
