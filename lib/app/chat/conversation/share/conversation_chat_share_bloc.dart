import 'package:fedi/app/share/message_input/share_message_input_bloc.dart';
import 'package:fedi/app/share/to_account/share_to_account_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationChatShareBloc extends IShareToAccountBloc {
  static IConversationChatShareBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IConversationChatShareBloc>(context, listen: listen);

  IShareMessageInputBloc get shareMessageInputBloc;
}
