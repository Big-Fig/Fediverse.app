import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_bloc_proxy_provider.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ConversationChatPostMessageBloc extends PostStatusBloc {
  final IConversationChatBloc conversationChatBloc;

  ConversationChatPostMessageBloc({
    required this.conversationChatBloc,
    required IUnifediApiStatusService unifediApiStatusService,
    required IStatusRepository statusRepository,
    required IScheduledStatusRepository scheduledStatusRepository,
    required IUnifediApiMediaAttachmentService unifediApiMediaAttachmentService,
    required int? maximumMessageLength,
    required UnifediApiInstancePollLimits? pollLimits,
    required int? maximumFileSizeInBytes,
    required bool markMediaAsNsfwOnAttach,
    required String? language,
  }) : super(
          isExpirePossible: false,
          unifediApiStatusService: unifediApiStatusService,
          statusRepository: statusRepository,
          scheduledStatusRepository: scheduledStatusRepository,
          unifediApiMediaAttachmentService: unifediApiMediaAttachmentService,
          initialData: PostStatusBloc.defaultInitData.copyWith(
            visibilityString: UnifediApiVisibility.private.toJsonValue(),
            language: language,
            inReplyToConversationId: conversationChatBloc.conversation.remoteId,
          ),
          // we dont need mentions if we have inReplyToConversationId
          initialAccountsToMention: null,
          maximumMessageLength: maximumMessageLength,
          pollLimits: pollLimits,
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
      unifediApiStatusService: Provider.of<IUnifediApiStatusService>(
        context,
        listen: false,
      ),
      statusRepository: IStatusRepository.of(
        context,
        listen: false,
      ),
      unifediApiMediaAttachmentService:
          Provider.of<IUnifediApiMediaAttachmentService>(
        context,
        listen: false,
      ),
      maximumMessageLength: info.limits?.status?.maxTootChars,
      pollLimits: info.limits?.poll,
      maximumFileSizeInBytes: info.limits?.media.uploadLimit,
      markMediaAsNsfwOnAttach: IPostStatusSettingsBloc.of(
        context,
        listen: false,
      ).markMediaAsNsfwOnAttach,
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

    // ignore: unawaited_futures
    conversationChatBloc.postMessage(
      postStatusData: currentPostStatusData,
      oldPendingFailedConversationChatMessage: null,
    );
  }
}
