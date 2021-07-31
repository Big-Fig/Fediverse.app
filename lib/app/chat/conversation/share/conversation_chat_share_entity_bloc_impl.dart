import 'dart:math';

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
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ConversationChatShareEntityBloc extends ConversationChatShareBloc
    implements IConversationChatShareBloc, IShareEntityBloc {
  final IMediaAttachmentReuploadService mediaAttachmentReuploadService;
  final IPleromaApiMediaAttachmentService pleromaApiMediaAttachmentService;
  final IShareEntitySettingsBloc shareEntitySettingsBloc;
  @override
  final ShareEntity shareEntity;

  final bool isNeedReUploadMediaAttachments;

  ConversationChatShareEntityBloc({
    required this.shareEntity,
    required this.shareEntitySettingsBloc,
    required this.mediaAttachmentReuploadService,
    required this.pleromaApiMediaAttachmentService,
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
  Future<List<IPleromaApiPostStatus>> createSendData({
    required String to,
    required PleromaApiVisibility visibility,
  }) async {
    var text = convertAllItemsToRawText(
      settings: shareEntitySettingsBloc.shareEntitySettings,
    );

    var mediaAttachments = await convertAllItemsToMediaAttachments(
      settings: shareEntitySettingsBloc.shareEntitySettings,
      pleromaApiMediaAttachmentService: pleromaApiMediaAttachmentService,
      mediaAttachmentReuploadService: mediaAttachmentReuploadService,
      reUploadRequired: true,
    );

    var result = <IPleromaApiPostStatus>[];

    var maximumMediaAttachmentCount =
        IPleromaApiAuthStatusService.maximumMediaAttachmentCount;
    if (mediaAttachments != null &&
        mediaAttachments.length > maximumMediaAttachmentCount) {
      var length = mediaAttachments.length;
      var currentIndex = 0;
      int minIndex;
      int maxIndex;
      do {
        minIndex = currentIndex * maximumMediaAttachmentCount;
        maxIndex = (currentIndex + 1) * maximumMediaAttachmentCount;
        var messageSendData = _createPleromaApiPostStatus(
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
      var messageSendData = _createPleromaApiPostStatus(
        text: text,
        to: to,
        visibility: visibility,
        mediaAttachments: mediaAttachments,
      );

      result.add(messageSendData);
    }

    return result;
  }

  PleromaApiPostStatus _createPleromaApiPostStatus({
    required String? text,
    required String to,
    required PleromaApiVisibility visibility,
    required List<IPleromaApiMediaAttachment>? mediaAttachments,
  }) {
    return PleromaApiPostStatus(
      status: '${text ?? ''} $to'.trim(),
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
        pleromaApiAuthStatusService: Provider.of<IPleromaApiAuthStatusService>(
          context,
          listen: false,
        ),
        pleromaConversationService:
            Provider.of<IPleromaApiConversationService>(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        accountRepository: IAccountRepository.of(context, listen: false),
        myAccountBloc: IMyAccountBloc.of(context, listen: false),
        pleromaAccountService: Provider.of<IPleromaApiAccountService>(
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
        pleromaApiMediaAttachmentService:
            Provider.of<IPleromaApiMediaAttachmentService>(
          context,
          listen: false,
        ),
      );
}
