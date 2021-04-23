import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_bloc.dart';
import 'package:fedi/app/chat/pleroma/post/pleroma_chat_post_message_bloc.dart';
import 'package:fedi/app/chat/pleroma/post/pleroma_chat_post_message_bloc_proxy_provider.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:fedi/app/message/post_message_bloc_impl.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:pedantic/pedantic.dart';

var _logger = Logger("chat_post_message_bloc_impl.dart");

class PleromaChatPostMessageBloc extends PostMessageBloc
    implements IPleromaChatPostMessageBloc {
  final IPleromaChatBloc pleromaChatBloc;

  PleromaChatPostMessageBloc({
    required this.pleromaChatBloc,
    required int? maximumMessageLength,
    required IPleromaMediaAttachmentService pleromaMediaAttachmentService,
    required int? maximumFileSizeInBytes,
  }) : super(
          maximumMessageLength: maximumMessageLength,
          maximumMediaAttachmentCount: 1,
          pleromaMediaAttachmentService: pleromaMediaAttachmentService,
          maximumFileSizeInBytes: maximumFileSizeInBytes,
          unfocusOnClear: false,
        );

  @override
  Future post() async {
    // todo: refactor
    unawaited(
      pleromaChatBloc.postMessage(
        pleromaApiChatMessageSendData: calculateSendData(),
        pleromaApiChatMessageSendDataMediaAttachment: calculateMediaAttachment(),
        oldPendingFailedPleromaChatMessage: null,
      ),
    );

    clear();
  }

  PleromaApiChatMessageSendData calculateSendData() {
    var mediaId = calculateMediaAttachmentId();

    var data = PleromaApiChatMessageSendData(
      content: inputText,
      mediaId: mediaId,
      idempotencyKey: idempotencyKey,
    );
    _logger.finest(() => "calculateSendData data=$data");

    return data;
  }

  String? calculateMediaAttachmentId() {
    return calculateMediaAttachment()?.id;
  }

  IPleromaApiMediaAttachment? calculateMediaAttachment() {
    var mediaAttachmentBlocs = mediaAttachmentsBloc.mediaAttachmentBlocs?.where(
      (bloc) =>
          bloc.uploadState!.type == UploadMediaAttachmentStateType.uploaded,
    );
    IPleromaApiMediaAttachment? mediaAttachment;
    if (mediaAttachmentBlocs?.isNotEmpty == true) {
      mediaAttachment = mediaAttachmentBlocs!.first.pleromaMediaAttachment;
    }
    return mediaAttachment;
  }

  static PleromaChatPostMessageBloc createFromContext(
    BuildContext context, {
    required String? chatRemoteId,
  }) {
    var info = ICurrentAuthInstanceBloc.of(context, listen: false)
        .currentInstance!
        .info!;
    return PleromaChatPostMessageBloc(
      pleromaChatBloc: IPleromaChatBloc.of(
        context,
        listen: false,
      ),
      pleromaMediaAttachmentService: IPleromaMediaAttachmentService.of(
        context,
        listen: false,
      ),
      maximumMessageLength: info.chatLimit,
      maximumFileSizeInBytes: info.uploadLimit,
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required String? chatRemoteId,
    required Widget child,
  }) {
    return DisposableProvider<IPleromaChatPostMessageBloc>(
      create: (context) => PleromaChatPostMessageBloc.createFromContext(
        context,
        chatRemoteId: chatRemoteId,
      ),
      child: PleromaChatPostMessageBlocProxyProvider(child: child),
    );
  }
}
