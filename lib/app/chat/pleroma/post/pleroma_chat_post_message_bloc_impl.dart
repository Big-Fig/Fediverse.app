import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/post/pleroma_chat_post_message_bloc.dart';
import 'package:fedi/app/chat/pleroma/post/pleroma_chat_post_message_bloc_proxy_provider.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:fedi/app/message/post_message_bloc_impl.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_service.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("chat_post_message_bloc_impl.dart");

class PleromaChatPostMessageBloc extends PostMessageBloc
    implements IPleromaChatPostMessageBloc {
  final IPleromaChatService pleromaChatService;
  final IPleromaChatMessageRepository chatMessageRepository;
  final String chatRemoteId;

  PleromaChatPostMessageBloc({
    @required this.pleromaChatService,
    @required this.chatMessageRepository,
    @required this.chatRemoteId,
    @required int maximumMessageLength,
    @required IPleromaMediaAttachmentService pleromaMediaAttachmentService,
    @required int maximumFileSizeInBytes,
  }) : super(
          maximumMessageLength: maximumMessageLength,
          maximumMediaAttachmentCount: 1,
          pleromaMediaAttachmentService: pleromaMediaAttachmentService,
          maximumFileSizeInBytes: maximumFileSizeInBytes,
        );

  @override
  Future<bool> post() async {
    bool success;

    var mediaAttachmentBlocs = mediaAttachmentsBloc.mediaAttachmentBlocs?.where(
        (bloc) =>
            bloc.uploadState.type == UploadMediaAttachmentStateType.uploaded);
    var mediaId;
    if (mediaAttachmentBlocs?.isNotEmpty == true) {
      mediaId = mediaAttachmentBlocs.first.pleromaMediaAttachment.id;
    }

    var data = PleromaChatMessageSendData(content: inputText, mediaId: mediaId);
    _logger.finest(() => "postMessage data=$data");
    var remoteChatMessage =
        await pleromaChatService.sendMessage(chatId: chatRemoteId, data: data);

    _logger.finest(() => "postMessage remoteChatMessage=$remoteChatMessage");
    if (remoteChatMessage != null) {
      success = true;
      await chatMessageRepository.upsertRemoteChatMessage(remoteChatMessage);

      // todo: remove hack
      // backend shouldn't mark chat as unread after message from me
      await pleromaChatService.markChatAsRead(
        chatId: chatRemoteId,
        lastReadChatMessageId: remoteChatMessage.id,
      );
    } else {
      success = false;
    }

    if (success) {
      clear();
    }
    return success;
  }

  static PleromaChatPostMessageBloc createFromContext(BuildContext context,
      {@required String chatRemoteId}) {
    var info = ICurrentAuthInstanceBloc.of(context, listen: false)
        .currentInstance
        .info;
    return PleromaChatPostMessageBloc(
      chatRemoteId: chatRemoteId,
      chatMessageRepository: IPleromaChatMessageRepository.of(context, listen: false),
      pleromaChatService: IPleromaChatService.of(context, listen: false),
      pleromaMediaAttachmentService:
          IPleromaMediaAttachmentService.of(context, listen: false),
      maximumMessageLength: info.chatLimit,
      maximumFileSizeInBytes: info.uploadLimit,
    );
  }

  static Widget provideToContext(BuildContext context,
      {@required String chatRemoteId, @required Widget child}) {
    return DisposableProvider<IPleromaChatPostMessageBloc>(
      create: (context) => PleromaChatPostMessageBloc.createFromContext(context,
          chatRemoteId: chatRemoteId),
      child: PleromaChatPostMessageBlocProxyProvider(child: child),
    );
  }
}
