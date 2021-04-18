import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_bloc_proxy_provider.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/pleroma/status/auth/pleroma_auth_status_service.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:pedantic/pedantic.dart';

class ConversationChatPostMessageBloc extends PostStatusBloc {
  final IConversationChatBloc conversationChatBloc;

  ConversationChatPostMessageBloc({
    required this.conversationChatBloc,
    required IPleromaAuthStatusService pleromaAuthStatusService,
    required IStatusRepository statusRepository,
    required IScheduledStatusRepository scheduledStatusRepository,
    required IPleromaMediaAttachmentService pleromaMediaAttachmentService,
    required int? maximumMessageLength,
    required PleromaInstancePollLimits? pleromaInstancePollLimits,
    required int? maximumFileSizeInBytes,
    required bool markMediaAsNsfwOnAttach,
    required String? language,
  }) : super(
          isExpirePossible: false,
          pleromaAuthStatusService: pleromaAuthStatusService,
          statusRepository: statusRepository,
          scheduledStatusRepository: scheduledStatusRepository,
          pleromaMediaAttachmentService: pleromaMediaAttachmentService,
          initialData: PostStatusBloc.defaultInitData.copyWith(
            visibility: PleromaVisibility.private.toJsonValue(),
            language: language,
            inReplyToConversationId:
                conversationChatBloc.conversation.remoteId,
          ),
          // we don't need mentions if we have inReplyToConversationId
          initialAccountsToMention: null,
          maximumMessageLength: maximumMessageLength,
          pleromaInstancePollLimits: pleromaInstancePollLimits,
          maximumFileSizeInBytes: maximumFileSizeInBytes,
          markMediaAsNsfwOnAttach: markMediaAsNsfwOnAttach,
          unfocusOnClear: false,
        );

  static ConversationChatPostMessageBloc createFromContext(
    BuildContext context, {
    required IConversationChat? conversation,
  }) {
    var info = ICurrentAuthInstanceBloc.of(context, listen: false)
        .currentInstance!
        .info!;

    return ConversationChatPostMessageBloc(
      pleromaAuthStatusService: IPleromaAuthStatusService.of(
        context,
        listen: false,
      ),
      statusRepository: IStatusRepository.of(
        context,
        listen: false,
      ),
      pleromaMediaAttachmentService: IPleromaMediaAttachmentService.of(
        context,
        listen: false,
      ),
      maximumMessageLength: info.maxTootChars,
      pleromaInstancePollLimits: info.pollLimits,
      maximumFileSizeInBytes: info.uploadLimit,
      markMediaAsNsfwOnAttach: IPostStatusSettingsBloc.of(
        context,
        listen: false,
      ).markMediaAsNsfwOnAttach ?? false,
      language: IPostStatusSettingsBloc.of(
        context,
        listen: false,
      ).defaultStatusLocale?.localeString,
      scheduledStatusRepository: IScheduledStatusRepository.of(
        context,
        listen: false,
      ),
      conversationChatBloc: IConversationChatBloc.of(
        context,
        listen: false,
      ),
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required IConversationChat? conversation,
    required Widget child,
  }) {
    return DisposableProvider<IPostStatusBloc>(
      create: (context) => ConversationChatPostMessageBloc.createFromContext(
        context,
        conversation: conversation,
      ),
      child: PostStatusMessageBlocProxyProvider(child: child),
    );
  }

  @override
  bool get isPossibleToChangeVisibility => false;

  @override
  Future actualPostStatus() async {
    var currentPostStatusData = calculateCurrentPostStatusData();

    unawaited(
      conversationChatBloc.postMessage(
        postStatusData: currentPostStatusData,
        oldPendingFailedConversationChatMessage: null,
      ),
    );
  }
}
