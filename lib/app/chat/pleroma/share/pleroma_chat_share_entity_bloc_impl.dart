import 'package:collection/collection.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
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
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class PleromaChatShareEntityBloc extends PleromaChatShareBloc
    implements IPleromaChatShareBloc, IShareEntityBloc {
  final IShareEntitySettingsBloc shareEntitySettingsBloc;
  @override
  final ShareEntity shareEntity;
  final IMediaAttachmentReuploadService mediaAttachmentReuploadService;
  final IUnifediApiMediaAttachmentService unifediApiMediaAttachmentService;
  final bool isNeedReUploadMediaAttachments;

  PleromaChatShareEntityBloc({
    required this.shareEntity,
    required this.shareEntitySettingsBloc,
    required this.mediaAttachmentReuploadService,
    required this.unifediApiMediaAttachmentService,
    this.isNeedReUploadMediaAttachments = true,
    required IPleromaChatRepository chatRepository,
    required IPleromaChatMessageRepository chatMessageRepository,
    required IUnifediApiChatService pleromaApiChatService,
    required IMyAccountBloc myAccountBloc,
    required IAccountRepository accountRepository,
    required IUnifediApiAccountService unifediApiAccountService,
  }) : super(
          chatRepository: chatRepository,
          chatMessageRepository: chatMessageRepository,
          pleromaApiChatService: pleromaApiChatService,
          myAccountBloc: myAccountBloc,
          accountRepository: accountRepository,
          unifediApiAccountService: unifediApiAccountService,
        );

  @override
  Future<List<UnifediApiPostChatMessage>>
      createUnifediApiChatMessageSendDataList() async {
    var text = convertAllItemsToRawText(
      settings: shareEntitySettingsBloc.shareEntitySettings,
    );
    var mediaAttachments = await convertAllItemsToMediaAttachments(
      settings: shareEntitySettingsBloc.shareEntitySettings,
      unifediApiMediaAttachmentService: unifediApiMediaAttachmentService,
      mediaAttachmentReuploadService: mediaAttachmentReuploadService,
      reUploadRequired: true,
    );

    var messageSendData = UnifediApiPostChatMessage(
      content: text?.trim(),
      mediaId: mediaAttachments?.firstOrNull?.id,
    );

    var result = <UnifediApiPostChatMessage>[];

    result.add(messageSendData);

    if (mediaAttachments != null && mediaAttachments.length > 1) {
      mediaAttachments.skip(1).forEach(
        (mediaAttachment) {
          result.add(
            UnifediApiPostChatMessage(
              content: null,
              mediaId: mediaAttachment.id,
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
        pleromaApiChatService: Provider.of<IUnifediApiChatService>(
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
        unifediApiAccountService: Provider.of<IUnifediApiAccountService>(
          context,
          listen: false,
        ),
        shareEntitySettingsBloc: IShareEntitySettingsBloc.of(
          context,
          listen: false,
        ),
        unifediApiMediaAttachmentService:
            Provider.of<IUnifediApiMediaAttachmentService>(
          context,
          listen: false,
        ),
      );
}
