import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/chat/conversation/conversation_chat_bloc.dart';
import 'package:fedi_app/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi_app/app/status/post/post_status_bloc.dart';
import 'package:fedi_app/app/status/post/post_status_bloc_impl.dart';
import 'package:fedi_app/app/status/post/post_status_bloc_proxy_provider.dart';
import 'package:fedi_app/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi_app/app/status/repository/status_repository.dart';
import 'package:fedi_app/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class ConversationChatPostMessageBloc extends PostStatusBloc {
  final IConversationChatBloc conversationChatBloc;

  ConversationChatPostMessageBloc({
    required this.conversationChatBloc,
    required IUnifediApiStatusService unifediApiStatusService,
    required IStatusRepository statusRepository,
    required IScheduledStatusRepository scheduledStatusRepository,
    required IUnifediApiMediaAttachmentService unifediApiMediaAttachmentService,
    required int? maximumMessageLength,
    required IUnifediApiInstancePollLimits? pollLimits,
    required int? maximumFileSizeInBytes,
    required bool markMediaAsNsfwOnAttach,
    required bool dontUploadMediaDuringEditing,
    required int? maximumMediaAttachmentCount,
    required String? language,
  }) : super(
          isExpirePossible: false,
          dontUploadMediaDuringEditing: dontUploadMediaDuringEditing,
          maximumMediaAttachmentCount: maximumMediaAttachmentCount,
          unifediApiStatusService: unifediApiStatusService,
          statusRepository: statusRepository,
          scheduledStatusRepository: scheduledStatusRepository,
          unifediApiMediaAttachmentService: unifediApiMediaAttachmentService,
          initialData: PostStatusBloc.defaultInitData.copyWith(
            visibilityString: UnifediApiVisibility.privateValue.stringValue,
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
    var info =
        ICurrentAccessBloc.of(context, listen: false).currentInstance!.info!;

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
      maximumMediaAttachmentCount:
          info.limits?.status?.maxMediaAttachmentsCount,
      maximumFileSizeInBytes: info.limits?.media?.uploadLimit,
      markMediaAsNsfwOnAttach: IPostStatusSettingsBloc.of(
        context,
        listen: false,
      ).markMediaAsNsfwOnAttach,
      dontUploadMediaDuringEditing: IPostStatusSettingsBloc.of(
        context,
        listen: false,
      ).dontUploadMediaDuringEditing,
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
  }) =>
      DisposableProvider<IPostStatusBloc>(
        create: (context) => ConversationChatPostMessageBloc.createFromContext(
          context,
          conversation: conversation,
        ),
        child: PostStatusMessageBlocProxyProvider(child: child),
      );

  @override
  bool get isPossibleToChangeVisibility => true;

  @override
  Future<void> actualPostStatus() async {
    var currentPostStatusData = calculateCurrentPostStatusData();

    // ignore: unawaited_futures
    conversationChatBloc.postMessage(
      postStatusData: currentPostStatusData,
      oldPendingFailedConversationChatMessage: null,
    );
  }
}
