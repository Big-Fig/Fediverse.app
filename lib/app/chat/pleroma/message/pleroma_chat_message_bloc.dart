import 'package:fedi/app/chat/message/chat_message_bloc.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaChatMessageBloc implements IChatMessageBloc {
  static IPleromaChatMessageBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaChatMessageBloc>(
        context,
        listen: listen,
      );

  @override
  IPleromaChatMessage get chatMessage;

  @override
  Stream<IPleromaChatMessage> get chatMessageStream;
}
