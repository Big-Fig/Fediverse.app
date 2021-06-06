import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_bloc.dart';
import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_bloc_proxy_provider.dart';
import 'package:fedi/app/html/html_text_helper.dart';
import 'package:fedi/app/media/attachment/reupload/media_attachment_reupload_service.dart';
import 'package:fedi/app/share/status/share_status_bloc.dart';
import 'package:fedi/app/share/to_account/share_to_account_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_service.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_model.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class PleromaChatShareStatusBloc extends PleromaChatShareBloc
    implements IPleromaChatShareBloc, IShareStatusBloc {
  @override
  final IStatus status;
  final IMediaAttachmentReuploadService mediaAttachmentReuploadService;
  final bool isNeedReUploadMediaAttachments;

  PleromaChatShareStatusBloc({
    required this.status,
    required this.mediaAttachmentReuploadService,
    this.isNeedReUploadMediaAttachments = true,
    required IPleromaChatRepository chatRepository,
    required IPleromaChatMessageRepository chatMessageRepository,
    required IPleromaApiChatService pleromaChatService,
    required IMyAccountBloc myAccountBloc,
    required IAccountRepository accountRepository,
    required IPleromaApiAccountService pleromaAccountService,
  }) : super(
          chatRepository: chatRepository,
          chatMessageRepository: chatMessageRepository,
          pleromaChatService: pleromaChatService,
          myAccountBloc: myAccountBloc,
          accountRepository: accountRepository,
          pleromaAccountService: pleromaAccountService,
        );

  @override
  Future<PleromaApiChatMessageSendData>
      createPleromaChatMessageSendData() async {
    var accountAcctAndDisplayName =
        status.account.acct + ' (${status.account.displayName})';

    var statusSpoiler = status.spoilerText;
    var statusContent = status.content?.isNotEmpty == true
        ? status.content?.extractRawStringFromHtmlString()
        : null;
    var statusUrl = status.url;
    String? statusMediaAttachmentsString;
    String? mediaId;
    if (status.mediaAttachments?.length == 1) {
      if (isNeedReUploadMediaAttachments) {
        var reuploadedMediaAttachment =
            await mediaAttachmentReuploadService.reuploadMediaAttachment(
          originalMediaAttachment: status.mediaAttachments!.first,
        );
        mediaId = reuploadedMediaAttachment.id;
      } else {
        mediaId = status.mediaAttachments!.first.id;
      }
    } else {
      statusMediaAttachmentsString = status.mediaAttachments
          ?.map((mediaAttachment) => mediaAttachment.url)
          .join(', ');
    }

    if (statusMediaAttachmentsString != null) {
      statusMediaAttachmentsString = '[$statusMediaAttachmentsString]';
    }
    var additionalMessage = message;

    var contentParts = <String?>[
      accountAcctAndDisplayName,
      statusSpoiler,
      statusContent,
      statusMediaAttachmentsString,
      additionalMessage,
      statusUrl,
    ].where((element) => element?.isNotEmpty == true).toList();

    var content = contentParts.join('\n\n');
    var messageSendData = PleromaApiChatMessageSendData(
      content: content.trim(),
      mediaId: mediaId,
      idempotencyKey: null,
    );

    return messageSendData;
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    required IStatus status,
    bool isNeedReUploadMediaAttachments = true,
  }) {
    return DisposableProvider<PleromaChatShareStatusBloc>(
      create: (context) => createFromContext(
        context,
        status: status,
        isNeedReUploadMediaAttachments: isNeedReUploadMediaAttachments,
      ),
      child: ProxyProvider<PleromaChatShareStatusBloc, IPleromaChatShareBloc>(
        update: (context, value, previous) => value,
        child: ProxyProvider<PleromaChatShareStatusBloc, IShareStatusBloc>(
          update: (context, value, previous) => value,
          child: ProxyProvider<PleromaChatShareStatusBloc, IShareToAccountBloc>(
            update: (context, value, previous) => value,
            child: PleromaChatShareBlocProxyProvider(child: child),
          ),
        ),
      ),
    );
  }

  static PleromaChatShareStatusBloc createFromContext(
    BuildContext context, {
    required IStatus status,
    bool isNeedReUploadMediaAttachments = true,
  }) =>
      PleromaChatShareStatusBloc(
        status: status,
        isNeedReUploadMediaAttachments: isNeedReUploadMediaAttachments,
        mediaAttachmentReuploadService: IMediaAttachmentReuploadService.of(
          context,
          listen: false,
        ),
        chatRepository: IPleromaChatRepository.of(
          context,
          listen: false,
        ),
        chatMessageRepository: IPleromaChatMessageRepository.of(
          context,
          listen: false,
        ),
        pleromaChatService: IPleromaApiChatService.of(
          context,
          listen: false,
        ),
        accountRepository: IAccountRepository.of(
          context,
          listen: false,
        ),
        myAccountBloc: IMyAccountBloc.of(
          context,
          listen: false,
        ),
        pleromaAccountService: IPleromaApiAccountService.of(
          context,
          listen: false,
        ),
      );
}
