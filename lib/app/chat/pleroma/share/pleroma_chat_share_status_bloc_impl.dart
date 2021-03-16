import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_bloc.dart';
import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_bloc_proxy_provider.dart';
import 'package:fedi/app/html/html_text_helper.dart';
import 'package:fedi/app/share/status/share_status_bloc.dart';
import 'package:fedi/app/share/to_account/share_to_account_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class PleromaChatShareStatusBloc extends PleromaChatShareBloc
    implements IPleromaChatShareBloc, IShareStatusBloc {
  @override
  final IStatus status;

  PleromaChatShareStatusBloc({
    required this.status,
    required IPleromaChatRepository chatRepository,
    required IPleromaChatMessageRepository chatMessageRepository,
    required IPleromaChatService pleromaChatService,
    required IMyAccountBloc myAccountBloc,
    required IAccountRepository accountRepository,
    required IPleromaAccountService pleromaAccountService,
  }) : super(
          chatRepository: chatRepository,
          chatMessageRepository: chatMessageRepository,
          pleromaChatService: pleromaChatService,
          myAccountBloc: myAccountBloc,
          accountRepository: accountRepository,
          pleromaAccountService: pleromaAccountService,
        );

  @override
  PleromaChatMessageSendData createPleromaChatMessageSendData() {
    var accountAcctAndDisplayName =
        status.account.acct + " (${status.account.displayName})";

    var statusSpoiler = status.spoilerText;
    var statusContent = status.content?.isNotEmpty == true
        ? status.content?.extractRawStringFromHtmlString()
        : null;
    var statusUrl = status.url;
    var statusMediaAttachmentsString = status.mediaAttachments
        ?.map((mediaAttachment) => mediaAttachment.url)
        .join(", ");

    if (statusMediaAttachmentsString != null) {
      statusMediaAttachmentsString = "[$statusMediaAttachmentsString]";
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

    var content = contentParts.join("\n\n");
    var messageSendData = PleromaChatMessageSendData(
      content: content.trim(),
      mediaId: null,
      idempotencyKey: null,
    );
    return messageSendData;
  }

  static Widget provideToContext(
    BuildContext context, {
    required IStatus status,
    required Widget child,
  }) {
    return DisposableProvider<PleromaChatShareStatusBloc>(
      create: (context) => createFromContext(context, status),
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
          BuildContext context, IStatus status) =>
      PleromaChatShareStatusBloc(
        status: status,
        chatRepository: IPleromaChatRepository.of(
          context,
          listen: false,
        ),
        chatMessageRepository: IPleromaChatMessageRepository.of(
          context,
          listen: false,
        ),
        pleromaChatService: IPleromaChatService.of(
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
        pleromaAccountService: IPleromaAccountService.of(
          context,
          listen: false,
        ),
      );
}
