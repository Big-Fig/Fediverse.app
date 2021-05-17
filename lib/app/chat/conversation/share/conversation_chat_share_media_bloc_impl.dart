import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/conversation/share/conversation_chat_share_bloc.dart';
import 'package:fedi/app/chat/conversation/share/conversation_chat_share_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/share/conversation_chat_share_bloc_proxy_provider.dart';
import 'package:fedi/app/media/attachment/reupload/media_attachment_reupload_service.dart';
import 'package:fedi/app/share/media/share_media_bloc.dart';
import 'package:fedi/app/share/to_account/share_to_account_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_service.dart';
import 'package:fedi/pleroma/api/conversation/pleroma_api_conversation_service.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:fedi/pleroma/api/status/auth/pleroma_api_auth_status_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ConversationChatShareMediaBloc extends ConversationChatShareBloc
    implements IConversationChatShareBloc, IShareMediaBloc {
  @override
  final IPleromaApiMediaAttachment mediaAttachment;

  final IMediaAttachmentReuploadService mediaAttachmentReuploadService;

  ConversationChatShareMediaBloc({
    required this.mediaAttachment,
    required this.mediaAttachmentReuploadService,
    required IConversationChatRepository conversationRepository,
    required IStatusRepository statusRepository,
    required IPleromaApiConversationService pleromaConversationService,
    required IPleromaApiAuthStatusService pleromaAuthStatusService,
    required IMyAccountBloc myAccountBloc,
    required IAccountRepository accountRepository,
    required IPleromaApiAccountService pleromaAccountService,
  }) : super(
          conversationRepository: conversationRepository,
          statusRepository: statusRepository,
          pleromaConversationService: pleromaConversationService,
          pleromaAuthStatusService: pleromaAuthStatusService,
          accountRepository: accountRepository,
          myAccountBloc: myAccountBloc,
          pleromaAccountService: pleromaAccountService,
        );

  @override
  Future<IPleromaApiPostStatus> createSendData({
    required String to,
    required PleromaApiVisibility visibility,
  }) async {
    var reploadedMediaAttachment = await mediaAttachmentReuploadService.reuploadMediaAttachment(
      originalMediaAttachment: mediaAttachment,
    );

    var messageSendData = PleromaApiPostStatus(
      contentType: null,
      expiresInSeconds: null,
      idempotencyKey: null,
      inReplyToConversationId: null,
      inReplyToId: null,
      language: null,
      mediaIds: [
        reploadedMediaAttachment.id,
      ],
      poll: null,
      preview: null,
      sensitive: false,
      spoilerText: null,
      to: null,
      status: '${message ?? ''} $to'.trim(),
      visibility: visibility.toJsonValue(),
    );

    return messageSendData;
  }

  static Widget provideToContext(
    BuildContext context, {
    required IPleromaApiMediaAttachment mediaAttachment,
    required Widget child,
  }) {
    return DisposableProvider<ConversationChatShareMediaBloc>(
      create: (context) => createFromContext(context, mediaAttachment),
      child: ProxyProvider<ConversationChatShareMediaBloc,
          IConversationChatShareBloc>(
        update: (context, value, previous) => value,
        child: ProxyProvider<ConversationChatShareMediaBloc, IShareMediaBloc>(
          update: (context, value, previous) => value,
          child: ProxyProvider<ConversationChatShareMediaBloc,
              IShareToAccountBloc>(
            update: (context, value, previous) => value,
            child: ConversationChatShareBlocProxyProvider(
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  static ConversationChatShareMediaBloc createFromContext(
    BuildContext context,
    IPleromaApiMediaAttachment mediaAttachment,
  ) =>
      ConversationChatShareMediaBloc(
        mediaAttachment: mediaAttachment,
        mediaAttachmentReuploadService: IMediaAttachmentReuploadService.of(
          context,
          listen: false,
        ),
        conversationRepository: IConversationChatRepository.of(
          context,
          listen: false,
        ),
        pleromaAuthStatusService: IPleromaApiAuthStatusService.of(
          context,
          listen: false,
        ),
        pleromaConversationService:
            IPleromaApiConversationService.of(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        accountRepository: IAccountRepository.of(context, listen: false),
        myAccountBloc: IMyAccountBloc.of(context, listen: false),
        pleromaAccountService: IPleromaApiAccountService.of(
          context,
          listen: false,
        ),
      );
}
