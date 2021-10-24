import 'package:fedi/app/chat/message/chat_message_bloc.dart';
import 'package:fedi/app/chat/unifedi/message/unifedi_chat_message_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IUnifediChatMessageBloc implements IChatMessageBloc {
  static IUnifediChatMessageBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IUnifediChatMessageBloc>(
        context,
        listen: listen,
      );

  @override
  IUnifediChatMessage get chatMessage;

  @override
  Stream<IUnifediChatMessage> get chatMessageStream;
}
