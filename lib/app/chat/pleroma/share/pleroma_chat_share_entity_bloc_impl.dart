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
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_service.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_model.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class PleromaChatShareEntityBloc extends PleromaChatShareBloc
    implements IPleromaChatShareBloc, IShareEntityBloc {
  final IShareEntitySettingsBloc shareEntitySettingsBloc;
  @override
  final ShareEntity shareEntity;
  final IMediaAttachmentReuploadService mediaAttachmentReuploadService;
  final bool isNeedReUploadMediaAttachments;

  PleromaChatShareEntityBloc({
    required this.shareEntity,
    required this.shareEntitySettingsBloc,
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
    var text = await combineAllItemsAsRawText(
      settings: shareEntitySettingsBloc.shareEntitySettings,
    );
    var mediaAttachments = await combineAllItemsAsMediaAttachments(
      settings: shareEntitySettingsBloc.shareEntitySettings,
    );


    var messageSendData = PleromaApiChatMessageSendData(
      content: text?.trim(),
      mediaId: mediaAttachments?.firstOrNull?.id,
      idempotencyKey: null,
    );

    return messageSendData;
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
        shareEntitySettingsBloc: IShareEntitySettingsBloc.of(
          context,
          listen: false,
        ),
      );
}
