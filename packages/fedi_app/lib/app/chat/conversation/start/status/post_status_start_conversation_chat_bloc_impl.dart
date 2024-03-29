import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi_app/app/status/post/post_status_bloc.dart';
import 'package:fedi_app/app/status/post/post_status_bloc_impl.dart';
import 'package:fedi_app/app/status/post/post_status_bloc_proxy_provider.dart';
import 'package:fedi_app/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi_app/app/status/repository/status_repository.dart';
import 'package:fedi_app/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/app/status/status_model_adapter.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

class PostStatusStartConversationChatBloc extends PostStatusBloc {
  final StatusCallback successCallback;

  final List<IAccount> conversationAccountsWithoutMe;

  @override
  Future<void> onStatusPosted(IUnifediApiStatus remoteStatus) async {
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
    required IUnifediApiInstancePollLimits? pollLimits,
    required int? maximumFileSizeInBytes,
    required bool markMediaAsNsfwOnAttach,
    required bool dontUploadMediaDuringEditing,
    required String? language,
    required int? maximumMediaAttachmentCount,
  }) : super(
          dontUploadMediaDuringEditing: dontUploadMediaDuringEditing,
          isExpirePossible: false,
          maximumMediaAttachmentCount: maximumMediaAttachmentCount,
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
    var info = ICurrentAccessBloc.of(context, listen: false)
        .currentInstance!
        .instance!;

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
      maximumMediaAttachmentCount:
          info.limits?.status?.maxMediaAttachmentsCount,
      maximumFileSizeInBytes: info.limits?.media?.uploadLimit,
      markMediaAsNsfwOnAttach:
          IPostStatusSettingsBloc.of(context, listen: false)
              .markMediaAsNsfwOnAttach,
      dontUploadMediaDuringEditing:
          IPostStatusSettingsBloc.of(context, listen: false)
              .dontUploadMediaDuringEditing,
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
  }) =>
      DisposableProvider<IPostStatusBloc>(
        create: (context) =>
            PostStatusStartConversationChatBloc.createFromContext(
          context,
          successCallback: successCallback,
          conversationAccountsWithoutMe: conversationAccountsWithoutMe,
        ),
        child: PostStatusMessageBlocProxyProvider(child: child),
      );

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
          String? inputWithoutMentionedAcctsText,
          List<IUploadMediaAttachmentBloc> mediaAttachmentBlocs,
          bool isAllAttachedMediaUploaded,
          bool isHaveAtLeastOneError,
          bool isPollBlocChanged,
          List<String> mentionedAccts,
        ) =>
            calculateStatusBlocIsReadyToPost(
              inputText: inputWithoutMentionedAcctsText,
              mediaAttachmentBlocs: mediaAttachmentBlocs,
              isAllAttachedMediaUploaded: isAllAttachedMediaUploaded,
              isPollBlocHaveErrors: isHaveAtLeastOneError,
              isPollBlocChanged: isPollBlocChanged,
            ) &&
            mentionedAccts.isNotEmpty,
      );
}
