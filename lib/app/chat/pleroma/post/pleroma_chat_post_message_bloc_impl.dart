import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model_adapter.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/post/pleroma_chat_post_message_bloc.dart';
import 'package:fedi/app/chat/pleroma/post/pleroma_chat_post_message_bloc_proxy_provider.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:fedi/app/message/post_message_bloc_impl.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_service.dart';
import 'package:fedi/pleroma/id/pleroma_fake_id_helper.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:pedantic/pedantic.dart';

var _logger = Logger("chat_post_message_bloc_impl.dart");

class PleromaChatPostMessageBloc extends PostMessageBloc
    implements IPleromaChatPostMessageBloc {
  final IMyAccount myAccount;
  final IPleromaChatService pleromaChatService;
  final IPleromaChatMessageRepository chatMessageRepository;
  final String chatRemoteId;

  PleromaChatPostMessageBloc({
    @required this.pleromaChatService,
    @required this.chatMessageRepository,
    @required this.chatRemoteId,
    @required this.myAccount,
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
    var data = calculateSendData();

    var createdAt = DateTime.now();
    var uniquePleromaFakeId = generateUniquePleromaFakeId();
    var dbChatMessage = DbChatMessage(
      id: null,
      remoteId: uniquePleromaFakeId,
      chatRemoteId: chatRemoteId,
      accountRemoteId: myAccount.remoteId,
      createdAt: createdAt,
      content: data.content,
      emojis: null,
      mediaAttachment: calculateMediaAttachment(),
      card: null,
      pendingState: PendingState.pending,
      oldPendingRemoteId: uniquePleromaFakeId,
    );
    var localId = await chatMessageRepository.insert(
      dbChatMessage,
    );

    clear();

    unawaited(
      pleromaChatService
          .sendMessage(
        chatId: chatRemoteId,
        data: data,
      )
          .then(
        (remoteChatMessage) async {
          if (remoteChatMessage != null) {
            await chatMessageRepository.updateById(
              localId,
              mapRemoteChatMessageToDbPleromaChatMessage(
                remoteChatMessage,
              ).copyWith(
                oldPendingRemoteId: uniquePleromaFakeId,
              ),
            );

            // todo: remove hack
            // backend shouldn't mark chat as unread if message from me
            await pleromaChatService.markChatAsRead(
              chatId: chatRemoteId,
              lastReadChatMessageId: remoteChatMessage.id,
            );
          } else {
            await chatMessageRepository.updateById(
              localId,
              dbChatMessage.copyWith(
                pendingState: PendingState.fail,
              ),
            );
          }
        },
      ).catchError(
        (error) {
          chatMessageRepository.updateById(
            localId,
            dbChatMessage.copyWith(
              pendingState: PendingState.fail,
            ),
          );
        },
      ),
    );

    return true;
  }

  PleromaChatMessageSendData calculateSendData() {
    var mediaId = calculateMediaAttachmentId();

    var data = PleromaChatMessageSendData(
      content: inputText,
      mediaId: mediaId,
      idempotencyKey: idempotencyKey,
    );
    _logger.finest(() => "calculateSendData data=$data");

    return data;
  }

  String calculateMediaAttachmentId() {
    return calculateMediaAttachment()?.id;
  }

  IPleromaMediaAttachment calculateMediaAttachment() {
    var mediaAttachmentBlocs = mediaAttachmentsBloc.mediaAttachmentBlocs?.where(
        (bloc) =>
            bloc.uploadState.type == UploadMediaAttachmentStateType.uploaded);
    IPleromaMediaAttachment mediaAttachment;
    if (mediaAttachmentBlocs?.isNotEmpty == true) {
      mediaAttachment = mediaAttachmentBlocs.first.pleromaMediaAttachment;
    }
    return mediaAttachment;
  }

  static PleromaChatPostMessageBloc createFromContext(
    BuildContext context, {
    @required String chatRemoteId,
  }) {
    var info = ICurrentAuthInstanceBloc.of(context, listen: false)
        .currentInstance
        .info;
    return PleromaChatPostMessageBloc(
      chatRemoteId: chatRemoteId,
      chatMessageRepository:
          IPleromaChatMessageRepository.of(context, listen: false),
      pleromaChatService: IPleromaChatService.of(context, listen: false),
      pleromaMediaAttachmentService:
          IPleromaMediaAttachmentService.of(context, listen: false),
      maximumMessageLength: info.chatLimit,
      maximumFileSizeInBytes: info.uploadLimit,
      myAccount: IMyAccountBloc.of(
        context,
        listen: false,
      ).myAccount,
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    @required String chatRemoteId,
    @required Widget child,
  }) {
    return DisposableProvider<IPleromaChatPostMessageBloc>(
      create: (context) => PleromaChatPostMessageBloc.createFromContext(context,
          chatRemoteId: chatRemoteId),
      child: PleromaChatPostMessageBlocProxyProvider(child: child),
    );
  }
}
