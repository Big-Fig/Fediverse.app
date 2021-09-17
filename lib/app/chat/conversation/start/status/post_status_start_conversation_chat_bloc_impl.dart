import 'package:easy_dispose_provider/easy_dispose_provider.dart';
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
import 'package:flutter/widgets.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class PostStatusStartConversationChatBloc extends PostStatusBloc {
  final StatusCallback successCallback;

  final List<IAccount> conversationAccountsWithoutMe;

  @override
  Future onStatusPosted(IUnifediApiStatus remoteStatus) async {
    await super.onStatusPosted(remoteStatus);
    successCallback(
      remoteStatus.toDbStatusPopulatedWrapper(),
    );
  }

  PostStatusStartConversationChatBloc({
    required this.conversationAccountsWithoutMe,
    required this.successCallback,
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
            visibilityString: UnifediApiVisibility.directValue.stringValue,
            language: language,
          ),
          initialAccountsToMention: conversationAccountsWithoutMe,
          maximumMessageLength: maximumMessageLength,
          pollLimits: pollLimits,
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
      unifediApiStatusService: Provider.of<IUnifediApiStatusService>(
        context,
        listen: false,
      ),
      statusRepository: IStatusRepository.of(context, listen: false),
      unifediApiMediaAttachmentService:
          Provider.of<IUnifediApiMediaAttachmentService>(
        context,
        listen: false,
      ),
      maximumMessageLength: info.limits?.status?.maxTootChars,
      pollLimits: info.limits?.poll,
      maximumFileSizeInBytes: info.limits?.media?.uploadLimit,
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
  bool get isReadyToPost => super.isReadyToPost && mentionedAccts.isNotEmpty;

  @override
  Stream<bool> get isReadyToPostStream => Rx.combineLatest6(
        inputWithoutMentionedAcctsTextStream,
        uploadMediaAttachmentsBloc.uploadMediaAttachmentBlocsStream,
        uploadMediaAttachmentsBloc.isAllAttachedMediaUploadedStream,
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
