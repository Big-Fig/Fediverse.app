import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_bloc_proxy_provider.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class PostStatusStartConversationBloc extends PostStatusBloc {
  final List<IAccount> conversationAccountsWithoutMe;

  PostStatusStartConversationBloc({
    @required this.conversationAccountsWithoutMe,
    @required IPleromaStatusService pleromaStatusService,
    @required IStatusRepository statusRepository,
    @required IPleromaMediaAttachmentService pleromaMediaAttachmentService,
    @required int maximumMessageLength,
    @required PleromaInstancePollLimits pleromaInstancePollLimits,
    @required int maximumFileSizeInBytes,
    @required bool markMediaNsfwByDefault,
  }) : super(
          pleromaStatusService: pleromaStatusService,
          statusRepository: statusRepository,
          pleromaMediaAttachmentService: pleromaMediaAttachmentService,
          initialData: PostStatusBloc.defaultInitData
              .copyWith(visibility: PleromaVisibility.direct.toJsonValue()),
          initialAccountsToMention: conversationAccountsWithoutMe,
          maximumMessageLength: maximumMessageLength,
          pleromaInstancePollLimits: pleromaInstancePollLimits,
          maximumFileSizeInBytes: maximumFileSizeInBytes,
          markMediaNsfwByDefault: markMediaNsfwByDefault,
        );

  static PostStatusStartConversationBloc createFromContext(BuildContext context,
      {@required List<IAccount> conversationAccountsWithoutMe}) {
    var info = ICurrentAuthInstanceBloc.of(context, listen: false)
        .currentInstance
        .info;
    var myAccountSettingsBloc =
        IMyAccountSettingsBloc.of(context, listen: false);
    return PostStatusStartConversationBloc(
      conversationAccountsWithoutMe: conversationAccountsWithoutMe,
      pleromaStatusService: IPleromaStatusService.of(context, listen: false),
      statusRepository: IStatusRepository.of(context, listen: false),
      pleromaMediaAttachmentService:
          IPleromaMediaAttachmentService.of(context, listen: false),
      maximumMessageLength: info.maxTootChars,
      pleromaInstancePollLimits: info.pollLimits,
      maximumFileSizeInBytes: info.uploadLimit,
      markMediaNsfwByDefault:
          myAccountSettingsBloc.markMediaNsfwByDefaultFieldBloc.currentValue,
    );
  }

  static Widget provideToContext(BuildContext context,
      {@required List<IAccount> conversationAccountsWithoutMe,
      @required Widget child}) {
    return DisposableProvider<IPostStatusBloc>(
      create: (context) => PostStatusStartConversationBloc.createFromContext(
        context,
        conversationAccountsWithoutMe: conversationAccountsWithoutMe,
      ),
      child: PostStatusMessageBlocProxyProvider(child: child),
    );
  }

  @override
  bool get isPossibleToChangeVisibility => false;

  @override
  bool get isReadyToPost =>
      super.isReadyToPost && mentionedAccts?.isNotEmpty == true;

  @override
  Stream<bool> get isReadyToPostStream => Rx.combineLatest6(
      inputWithoutMentionedAcctsTextStream,
      mediaAttachmentsBloc.mediaAttachmentBlocsStream,
      mediaAttachmentsBloc.isAllAttachedMediaUploadedStream,
      pollBloc.isHaveAtLeastOneErrorStream,
      pollBloc.isSomethingChangedStream,
      mentionedAcctsStream,
      (
        inputWithoutMentionedAcctsText,
        mediaAttachmentBlocs,
        isAllAttachedMediaUploaded,
        isHaveAtLeastOneError,
        isPollBlocChanged,
        mentionedAccts,
      ) =>
          calculateStatusBlocIsReadyToPost(
            inputText: inputWithoutMentionedAcctsText,
            mediaAttachmentBlocs: mediaAttachmentBlocs,
            isAllAttachedMediaUploaded: isAllAttachedMediaUploaded,
            isPollBlocHaveErrors: isHaveAtLeastOneError,
            isPollBlocChanged: isPollBlocChanged,
          ) &&
          mentionedAccts?.isNotEmpty == true);
}
