import 'package:fedi/app/chat/chat_bloc.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaChatBloc implements IChatBloc, IAsyncInitLoadingBloc {
  static IPleromaChatBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPleromaChatBloc>(context, listen: listen);

  @override
  IPleromaChat get chat;

  @override
  Stream<IPleromaChat> get chatStream;

  @override
  IPleromaChatMessage? get lastChatMessage;

  @override
  IPleromaChatMessage? get lastPublishedChatMessage;

  @override
  Stream<IPleromaChatMessage?> get lastChatMessageStream;

  Stream<IPleromaChatMessage> get onMessageLocallyHiddenStream;

  Future postMessage({
    required
        IPleromaApiChatMessageSendData pleromaApiChatMessageSendData,
    required IPleromaApiMediaAttachment? pleromaApiChatMessageSendDataMediaAttachment,
    required IPleromaChatMessage? oldPendingFailedPleromaChatMessage,
  });

  Future deleteMessage({
    required IPleromaChatMessage pleromaChatMessage,
  });
}
