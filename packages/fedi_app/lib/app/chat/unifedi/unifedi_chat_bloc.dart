import 'package:fedi_app/app/chat/chat_bloc.dart';
import 'package:fedi_app/app/chat/unifedi/message/unifedi_chat_message_model.dart';
import 'package:fedi_app/app/chat/unifedi/unifedi_chat_model.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IUnifediChatBloc implements IChatBloc, IAsyncInitLoadingBloc {
  static IUnifediChatBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IUnifediChatBloc>(context, listen: listen);

  @override
  IUnifediChat get chat;

  @override
  Stream<IUnifediChat> get chatStream;

  @override
  IUnifediChatMessage? get lastChatMessage;

  @override
  IUnifediChatMessage? get lastPublishedChatMessage;

  @override
  Stream<IUnifediChatMessage?> get lastChatMessageStream;

  Stream<IUnifediChatMessage> get onMessageLocallyHiddenStream;

  Future<void> postMessage({
    required String? idempotencyKey,
    required IUnifediApiPostChatMessage unifediApiPostChatMessage,
    required IUnifediApiMediaAttachment?
        unifediApiPostChatMessageMediaAttachment,
    required IUnifediChatMessage? oldPendingFailedUnifediChatMessage,
  });

  Future<void> deleteMessage({
    required IUnifediChatMessage chatMessage,
  });
}
