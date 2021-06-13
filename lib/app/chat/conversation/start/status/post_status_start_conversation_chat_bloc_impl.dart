import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_bloc_proxy_provider.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_service.dart';
import 'package:fedi/pleroma/api/status/auth/pleroma_api_auth_status_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class PostStatusStartConversationChatBloc extends PostStatusBloc {
  final StatusCallback successCallback;

  final List<IAccount> conversationAccountsWithoutMe;

  @override
  Future onStatusPosted(IPleromaApiStatus remoteStatus) async {
    await super.onStatusPosted(remoteStatus);
    successCallback(
      remoteStatus.toDbStatusPopulatedWrapper(),
    );
  }

  PostStatusStartConversationChatBloc({
    required this.conversationAccountsWithoutMe,
    required this.successCallback,
    required IPleromaApiAuthStatusService pleromaAuthStatusService,
    required IStatusRepository statusRepository,
    required IScheduledStatusRepository scheduledStatusRepository,
    required IPleromaApiMediaAttachmentService pleromaMediaAttachmentService,
    required int? maximumMessageLength,
    required PleromaApiInstancePollLimits? pleromaInstancePollLimits,
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
            visibilityString: PleromaApiVisibility.direct.toJsonValue(),
            language: language,
          ),
          initialAccountsToMention: conversationAccountsWithoutMe,
          maximumMessageLength: maximumMessageLength,
          pleromaInstancePollLimits: pleromaInstancePollLimits,
          maximumFileSizeInBytes: maximumFileSizeInBytes,
          markMediaAsNsfwOnAttach: markMediaAsNsfwOnAttach,
          unfocusOnClear: true,
        );

  static PostStatusStartConversationChatBloc createFromContext(
    BuildContext context, {
    required List<IAccount> conversationAccountsWithoutMe,
    required StatusCallback successCallback,
  }) {
    var info = ICurrentAuthInstanceBloc.of(context, listen: false)
        .currentInstance!
        .info!;

    return PostStatusStartConversationChatBloc(
      successCallback: successCallback,
      conversationAccountsWithoutMe: conversationAccountsWithoutMe,
      pleromaAuthStatusService: IPleromaApiAuthStatusService.of(
        context,
        listen: false,
      ),
      statusRepository: IStatusRepository.of(context, listen: false),
      pleromaMediaAttachmentService:
          IPleromaApiMediaAttachmentService.of(context, listen: false),
      maximumMessageLength: info.maxTootChars,
      pleromaInstancePollLimits: info.pollLimits,
      maximumFileSizeInBytes: info.uploadLimit,
      markMediaAsNsfwOnAttach:
          IPostStatusSettingsBloc.of(context, listen: false)
                  .markMediaAsNsfwOnAttach,
      language: IPostStatusSettingsBloc.of(context, listen: false)
          .defaultStatusLocale
          ?.localeString,
      scheduledStatusRepository: IScheduledStatusRepository.of(
        context,
        listen: false,
      ),
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required List<IAccount> conversationAccountsWithoutMe,
    required Widget child,
    required StatusCallback successCallback,
  }) {
    return DisposableProvider<IPostStatusBloc>(
      create: (context) =>
          PostStatusStartConversationChatBloc.createFromContext(
        context,
        successCallback: successCallback,
        conversationAccountsWithoutMe: conversationAccountsWithoutMe,
      ),
      child: PostStatusMessageBlocProxyProvider(child: child),
    );
  }

  @override
  bool get isPossibleToChangeVisibility => false;

  @override
  bool get isReadyToPost =>
      super.isReadyToPost && mentionedAccts.isNotEmpty;

  @override
  Stream<bool> get isReadyToPostStream => Rx.combineLatest6(
        inputWithoutMentionedAcctsTextStream,
        mediaAttachmentsBloc.mediaAttachmentBlocsStream,
        mediaAttachmentsBloc.isAllAttachedMediaUploadedStream,
        pollBloc.isHaveAtLeastOneErrorStream,
        pollBloc.isSomethingChangedStream,
        mentionedAcctsStream,
        (
          dynamic inputWithoutMentionedAcctsText,
          dynamic mediaAttachmentBlocs,
          dynamic isAllAttachedMediaUploaded,
          dynamic isHaveAtLeastOneError,
          dynamic isPollBlocChanged,
          dynamic mentionedAccts,
        ) =>
            calculateStatusBlocIsReadyToPost(
              inputText: inputWithoutMentionedAcctsText,
              mediaAttachmentBlocs: mediaAttachmentBlocs,
              isAllAttachedMediaUploaded: isAllAttachedMediaUploaded,
              isPollBlocHaveErrors: isHaveAtLeastOneError,
              isPollBlocChanged: isPollBlocChanged,
            ) &&
            mentionedAccts?.isNotEmpty == true,
      );
}
