import 'package:collection/collection.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_bloc.dart';
import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_bloc_proxy_provider.dart';
import 'package:fedi/app/media/attachment/reupload/media_attachment_reupload_service.dart';
import 'package:fedi/app/share/entity/settings/share_entity_settings_bloc.dart';
import 'package:fedi/app/share/entity/share_entity_bloc.dart';
import 'package:fedi/app/share/entity/share_entity_model.dart';
import 'package:fedi/app/share/to_account/share_to_account_bloc.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class PleromaChatShareEntityBloc extends PleromaChatShareBloc
    implements IPleromaChatShareBloc, IShareEntityBloc {
  final IShareEntitySettingsBloc shareEntitySettingsBloc;
  @override
  final ShareEntity shareEntity;
  final IMediaAttachmentReuploadService mediaAttachmentReuploadService;
  final IPleromaApiMediaAttachmentService pleromaApiMediaAttachmentService;
  final bool isNeedReUploadMediaAttachments;

  PleromaChatShareEntityBloc({
    required this.shareEntity,
    required this.shareEntitySettingsBloc,
    required this.mediaAttachmentReuploadService,
    required this.pleromaApiMediaAttachmentService,
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
  Future<List<PleromaApiChatMessageSendData>>
      createPleromaChatMessageSendDataList() async {
    var text = convertAllItemsToRawText(
      settings: shareEntitySettingsBloc.shareEntitySettings,
    );
    var mediaAttachments = await convertAllItemsToMediaAttachments(
      settings: shareEntitySettingsBloc.shareEntitySettings,
      pleromaApiMediaAttachmentService: pleromaApiMediaAttachmentService,
      mediaAttachmentReuploadService: mediaAttachmentReuploadService,
      reUploadRequired: true,
    );

    var messageSendData = PleromaApiChatMessageSendData(
      content: text?.trim(),
      mediaId: mediaAttachments?.firstOrNull?.id,
      idempotencyKey: null,
    );

    var result = <PleromaApiChatMessageSendData>[];

    result.add(messageSendData);

    if (mediaAttachments != null && mediaAttachments.length > 1) {
      mediaAttachments.skip(1).forEach(
        (mediaAttachment) {
          result.add(
            PleromaApiChatMessageSendData(
              content: null,
              mediaId: mediaAttachment.id,
              idempotencyKey: null,
            ),
          );
        },
      );
    }

    return result;
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    required ShareEntity shareEntity,
  }) {
    return DisposableProvider<PleromaChatShareEntityBloc>(
      create: (context) => createFromContext(
        context,
        shareEntity: shareEntity,
      ),
      child: ProxyProvider<PleromaChatShareEntityBloc, IPleromaChatShareBloc>(
        update: (context, value, previous) => value,
        child: ProxyProvider<PleromaChatShareEntityBloc, IShareEntityBloc>(
          update: (context, value, previous) => value,
          child: ProxyProvider<PleromaChatShareEntityBloc, IShareToAccountBloc>(
            update: (context, value, previous) => value,
            child: PleromaChatShareBlocProxyProvider(child: child),
          ),
        ),
      ),
    );
  }

  static PleromaChatShareEntityBloc createFromContext(
    BuildContext context, {
    required ShareEntity shareEntity,
  }) =>
      PleromaChatShareEntityBloc(
        shareEntity: shareEntity,
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
        pleromaChatService: Provider.of<IPleromaApiChatService>(
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
        pleromaAccountService: Provider.of<IPleromaApiAccountService>(
          context,
          listen: false,
        ),
        shareEntitySettingsBloc: IShareEntitySettingsBloc.of(
          context,
          listen: false,
        ),
        pleromaApiMediaAttachmentService:
            Provider.of<IPleromaApiMediaAttachmentService>(
          context,
          listen: false,
        ),
      );
}
