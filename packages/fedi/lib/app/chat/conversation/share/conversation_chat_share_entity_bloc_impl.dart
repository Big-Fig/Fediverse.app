import 'dart:math';

import 'package:easy_dispose_provider/easy_dispose_provider.dart';
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
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class ConversationChatShareEntityBloc extends ConversationChatShareBloc
    implements IConversationChatShareBloc, IShareEntityBloc {
  final IMediaAttachmentReuploadService mediaAttachmentReuploadService;
  final IUnifediApiMediaAttachmentService unifediApiMediaAttachmentService;
  final IShareEntitySettingsBloc shareEntitySettingsBloc;
  @override
  final ShareEntity shareEntity;

  final bool isNeedReUploadMediaAttachments;

  ConversationChatShareEntityBloc({
    required this.shareEntity,
    required this.shareEntitySettingsBloc,
    required this.mediaAttachmentReuploadService,
    required this.unifediApiMediaAttachmentService,
    this.isNeedReUploadMediaAttachments = true,
    required IConversationChatRepository conversationRepository,
    required IStatusRepository statusRepository,
    required IUnifediApiConversationService unifediConversationService,
    required IUnifediApiStatusService unifediApiStatusService,
    required IMyAccountBloc myAccountBloc,
    required IAccountRepository accountRepository,
  }) : super(
          conversationRepository: conversationRepository,
          statusRepository: statusRepository,
          unifediApiConversationService: unifediConversationService,
          unifediApiStatusService: unifediApiStatusService,
          accountRepository: accountRepository,
          myAccountBloc: myAccountBloc,
        );

  @override
  Future<List<IUnifediApiPostStatus>> createSendData({
    required String to,
    required UnifediApiVisibility visibility,
  }) async {
    var text = convertAllItemsToRawText(
      settings: shareEntitySettingsBloc.shareEntitySettings,
    );

    var mediaAttachments = await convertAllItemsToMediaAttachments(
      settings: shareEntitySettingsBloc.shareEntitySettings,
      unifediApiMediaAttachmentService: unifediApiMediaAttachmentService,
      mediaAttachmentReuploadService: mediaAttachmentReuploadService,
      reUploadRequired: true,
    );

    var result = <IUnifediApiPostStatus>[];

    var maximumMediaAttachmentCount = unifediApiStatusService.restService
        .accessBloc.access.instance?.limits?.status?.maxMediaAttachmentsCount;
    if (mediaAttachments != null &&
        maximumMediaAttachmentCount != null &&
        mediaAttachments.length > maximumMediaAttachmentCount) {
      var length = mediaAttachments.length;
      var currentIndex = 0;
      int minIndex;
      int maxIndex;
      do {
        minIndex = currentIndex * maximumMediaAttachmentCount;
        maxIndex = (currentIndex + 1) * maximumMediaAttachmentCount;
        var messageSendData = _createPostStatus(
          text: text,
          to: to,
          visibility: visibility,
          mediaAttachments: mediaAttachments.sublist(
            minIndex,
            min(
              maxIndex,
              length,
            ),
          ),
        );

        result.add(messageSendData);
      } while (maxIndex < length);
    } else {
      var messageSendData = _createPostStatus(
        text: text,
        to: to,
        visibility: visibility,
        mediaAttachments: mediaAttachments,
      );

      result.add(messageSendData);
    }

    return result;
  }

  UnifediApiPostStatus _createPostStatus({
    required String? text,
    required String to,
    required UnifediApiVisibility visibility,
    required List<IUnifediApiMediaAttachment>? mediaAttachments,
  }) =>
      UnifediApiPostStatus(
        status: '${text ?? ''} $to'.trim(),
        visibility: visibility.stringValue,
        contentType: null,
        expiresInSeconds: null,
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

  static Widget provideToContext(
    BuildContext context, {
    required ShareEntity shareEntity,
    required Widget child,
  }) =>
      DisposableProvider<ConversationChatShareEntityBloc>(
        create: (context) => createFromContext(
          context,
          shareEntity: shareEntity,
        ),
        child: ProxyProvider<ConversationChatShareEntityBloc,
            IConversationChatShareBloc>(
          update: (context, value, previous) => value,
          child:
              ProxyProvider<ConversationChatShareEntityBloc, IShareEntityBloc>(
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
        unifediApiStatusService: Provider.of<IUnifediApiStatusService>(
          context,
          listen: false,
        ),
        unifediConversationService:
            Provider.of<IUnifediApiConversationService>(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        accountRepository: IAccountRepository.of(context, listen: false),
        myAccountBloc: IMyAccountBloc.of(context, listen: false),
        mediaAttachmentReuploadService: IMediaAttachmentReuploadService.of(
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
