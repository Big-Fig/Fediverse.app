import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_bloc.dart';
import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_bloc_proxy_provider.dart';
import 'package:fedi/app/media/attachment/reupload/media_attachment_reupload_service.dart';
import 'package:fedi/app/share/media/share_media_bloc.dart';
import 'package:fedi/app/share/to_account/share_to_account_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_service.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_model.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_service.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class PleromaChatShareMediaBloc extends PleromaChatShareBloc
    implements IPleromaChatShareBloc, IShareMediaBloc {
  @override
  final IPleromaApiMediaAttachment mediaAttachment;

  final IMediaAttachmentReuploadService mediaAttachmentReuploadService;

  PleromaChatShareMediaBloc({
    required this.mediaAttachment,
    required this.mediaAttachmentReuploadService,
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
    var reploadedMediaAttachment =
        await mediaAttachmentReuploadService.reuploadMediaAttachment(
      originalMediaAttachment: mediaAttachment,
    );

    var messageSendData = PleromaApiChatMessageSendData(
      content: '${message ?? ''}'.trim(),
      idempotencyKey: null,
      mediaId: reploadedMediaAttachment.id,
    );

    return messageSendData;
  }

  static Widget provideToContext(
    BuildContext context, {
    required IPleromaApiMediaAttachment mediaAttachment,
    required Widget child,
  }) {
    return DisposableProvider<PleromaChatShareMediaBloc>(
      create: (context) => createFromContext(context, mediaAttachment),
      child: ProxyProvider<PleromaChatShareMediaBloc, IPleromaChatShareBloc>(
        update: (context, value, previous) => value,
        child: ProxyProvider<PleromaChatShareMediaBloc, IShareMediaBloc>(
          update: (context, value, previous) => value,
          child: ProxyProvider<PleromaChatShareMediaBloc, IShareToAccountBloc>(
            update: (context, value, previous) => value,
            child: PleromaChatShareBlocProxyProvider(child: child),
          ),
        ),
      ),
    );
  }

  static PleromaChatShareMediaBloc createFromContext(
    BuildContext context,
    IPleromaApiMediaAttachment mediaAttachment,
  ) =>
      PleromaChatShareMediaBloc(
        mediaAttachment: mediaAttachment,
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
        accountRepository: IAccountRepository.of(context, listen: false),
        pleromaAccountService: IPleromaApiAccountService.of(
          context,
          listen: false,
        ),
        myAccountBloc: IMyAccountBloc.of(
          context,
          listen: false,
        ),
      );
}
