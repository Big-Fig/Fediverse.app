import 'package:collection/collection.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/chat/unifedi/message/repository/unifedi_chat_message_repository.dart';
import 'package:fedi/app/chat/unifedi/repository/unifedi_chat_repository.dart';
import 'package:fedi/app/chat/unifedi/share/unifedi_chat_share_bloc.dart';
import 'package:fedi/app/chat/unifedi/share/unifedi_chat_share_bloc_impl.dart';
import 'package:fedi/app/chat/unifedi/share/unifedi_chat_share_bloc_proxy_provider.dart';
import 'package:fedi/app/media/attachment/reupload/media_attachment_reupload_service.dart';
import 'package:fedi/app/share/entity/settings/share_entity_settings_bloc.dart';
import 'package:fedi/app/share/entity/share_entity_bloc.dart';
import 'package:fedi/app/share/entity/share_entity_model.dart';
import 'package:fedi/app/share/to_account/share_to_account_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class UnifediChatShareEntityBloc extends UnifediChatShareBloc
    implements IUnifediChatShareBloc, IShareEntityBloc {
  final IShareEntitySettingsBloc shareEntitySettingsBloc;
  @override
  final ShareEntity shareEntity;
  final IMediaAttachmentReuploadService mediaAttachmentReuploadService;
  final IUnifediApiMediaAttachmentService unifediApiMediaAttachmentService;
  final bool isNeedReUploadMediaAttachments;

  UnifediChatShareEntityBloc({
    required this.shareEntity,
    required this.shareEntitySettingsBloc,
    required this.mediaAttachmentReuploadService,
    required this.unifediApiMediaAttachmentService,
    this.isNeedReUploadMediaAttachments = true,
    required IUnifediChatRepository chatRepository,
    required IUnifediChatMessageRepository chatMessageRepository,
    required IUnifediApiChatService unifediApiChatService,
  }) : super(
          chatRepository: chatRepository,
          chatMessageRepository: chatMessageRepository,
          unifediApiChatService: unifediApiChatService,
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

    // ignore: cascade_invocations
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
  }) =>
      DisposableProvider<UnifediChatShareEntityBloc>(
        create: (context) => createFromContext(
          context,
          shareEntity: shareEntity,
        ),
        child: ProxyProvider<UnifediChatShareEntityBloc, IUnifediChatShareBloc>(
          update: (context, value, previous) => value,
          child: ProxyProvider<UnifediChatShareEntityBloc, IShareEntityBloc>(
            update: (context, value, previous) => value,
            child:
                ProxyProvider<UnifediChatShareEntityBloc, IShareToAccountBloc>(
              update: (context, value, previous) => value,
              child: UnifediChatShareBlocProxyProvider(child: child),
            ),
          ),
        ),
      );

  static UnifediChatShareEntityBloc createFromContext(
    BuildContext context, {
    required ShareEntity shareEntity,
  }) =>
      UnifediChatShareEntityBloc(
        shareEntity: shareEntity,
        mediaAttachmentReuploadService: IMediaAttachmentReuploadService.of(
          context,
          listen: false,
        ),
        chatRepository: IUnifediChatRepository.of(
          context,
          listen: false,
        ),
        chatMessageRepository: IUnifediChatMessageRepository.of(
          context,
          listen: false,
        ),
        unifediApiChatService: Provider.of<IUnifediApiChatService>(
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
