import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/conversation/share/conversation_chat_share_bloc.dart';
import 'package:fedi/app/chat/conversation/share/conversation_chat_share_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/share/conversation_chat_share_bloc_proxy_provider.dart';
import 'package:fedi/app/media/attachment/reupload/media_attachment_reupload_service.dart';
import 'package:fedi/app/share/entity/settings/share_entity_settings_bloc.dart';
import 'package:fedi/app/share/entity/share_entity_bloc.dart';
import 'package:fedi/app/share/entity/share_entity_model.dart';
import 'package:fedi/app/share/to_account/share_to_account_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_service.dart';
import 'package:fedi/pleroma/api/conversation/pleroma_api_conversation_service.dart';
import 'package:fedi/pleroma/api/status/auth/pleroma_api_auth_status_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ConversationChatShareEntityBloc extends ConversationChatShareBloc
    implements IConversationChatShareBloc, IShareEntityBloc {
  final IMediaAttachmentReuploadService mediaAttachmentReuploadService;
  final IShareEntitySettingsBloc shareEntitySettingsBloc;
  @override
  final ShareEntity shareEntity;

  final bool isNeedReUploadMediaAttachments;

  ConversationChatShareEntityBloc({
    required this.shareEntity,
    required this.shareEntitySettingsBloc,
    required this.mediaAttachmentReuploadService,
    this.isNeedReUploadMediaAttachments = true,
    required IConversationChatRepository conversationRepository,
    required IStatusRepository statusRepository,
    required IPleromaApiConversationService pleromaConversationService,
    required IPleromaApiAuthStatusService pleromaApiAuthStatusService,
    required IMyAccountBloc myAccountBloc,
    required IAccountRepository accountRepository,
    required IPleromaApiAccountService pleromaAccountService,
  }) : super(
          conversationRepository: conversationRepository,
          statusRepository: statusRepository,
          pleromaApiConversationService: pleromaConversationService,
          pleromaApiAuthStatusService: pleromaApiAuthStatusService,
          accountRepository: accountRepository,
          myAccountBloc: myAccountBloc,
          pleromaAccountService: pleromaAccountService,
        );

  @override
  Future<IPleromaApiPostStatus> createSendData({
    required String to,
    required PleromaApiVisibility visibility,
  }) async {
    var text = await combineAllItemsAsRawText(
      settings: shareEntitySettingsBloc.shareEntitySettings,
    );
    var mediaAttachments = await combineAllItemsAsMediaAttachments(
      settings: shareEntitySettingsBloc.shareEntitySettings,
    );

    var messageSendData = PleromaApiPostStatus(
      status: '$text $to'.trim(),
      visibility: visibility.toJsonValue(),
      contentType: null,
      expiresInSeconds: null,
      idempotencyKey: null,
      inReplyToConversationId: null,
      inReplyToId: null,
      language: null,
      mediaIds: mediaAttachments
          ?.map((mediaAttachment) => mediaAttachment.id)
          .toList(),
      poll: null,
      preview: null,
      sensitive: false,
      spoilerText: null,
      to: null,
    );

    return messageSendData;
  }

  static Widget provideToContext(
    BuildContext context, {
    required ShareEntity shareEntity,
    required Widget child,
  }) {
    return DisposableProvider<ConversationChatShareEntityBloc>(
      create: (context) => createFromContext(
        context,
        shareEntity: shareEntity,
      ),
      child: ProxyProvider<ConversationChatShareEntityBloc,
          IConversationChatShareBloc>(
        update: (context, value, previous) => value,
        child: ProxyProvider<ConversationChatShareEntityBloc, IShareEntityBloc>(
          update: (context, value, previous) => value,
          child: ProxyProvider<ConversationChatShareEntityBloc,
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

  static ConversationChatShareEntityBloc createFromContext(
    BuildContext context, {
    required ShareEntity shareEntity,
  }) =>
      ConversationChatShareEntityBloc(
        shareEntity: shareEntity,
        conversationRepository: IConversationChatRepository.of(
          context,
          listen: false,
        ),
        pleromaApiAuthStatusService: IPleromaApiAuthStatusService.of(
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
        mediaAttachmentReuploadService: IMediaAttachmentReuploadService.of(
          context,
          listen: false,
        ),
        shareEntitySettingsBloc: IShareEntitySettingsBloc.of(
          context,
          listen: false,
        ),
      );
}
