import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_bloc_proxy_provider.dart';
import 'package:fedi/app/status/post/post_status_data_status_status_adapter.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/id/pleroma_fake_id_helper.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:pedantic/pedantic.dart';

class ConversationChatPostMessageBloc extends PostStatusBloc {
  final IMyAccount myAccount;
  final IConversationChat conversation;
  final List<IAccount> conversationAccountsWithoutMe;

  ConversationChatPostMessageBloc({
    @required this.myAccount,
    @required this.conversation,
    @required this.conversationAccountsWithoutMe,
    @required IPleromaStatusService pleromaStatusService,
    @required IStatusRepository statusRepository,
    @required IScheduledStatusRepository scheduledStatusRepository,
    @required IPleromaMediaAttachmentService pleromaMediaAttachmentService,
    @required int maximumMessageLength,
    @required PleromaInstancePollLimits pleromaInstancePollLimits,
    @required int maximumFileSizeInBytes,
    @required bool markMediaAsNsfwOnAttach,
    @required String language,
  }) : super(
          isExpirePossible: false,
          pleromaAuthStatusService: pleromaStatusService,
          statusRepository: statusRepository,
          scheduledStatusRepository: scheduledStatusRepository,
          pleromaMediaAttachmentService: pleromaMediaAttachmentService,
          initialData: PostStatusBloc.defaultInitData.copyWith(
            visibility: PleromaVisibility.private.toJsonValue(),
            language: language,
            inReplyToConversationId: conversation.remoteId,
          ),
          initialAccountsToMention: conversationAccountsWithoutMe,
          maximumMessageLength: maximumMessageLength,
          pleromaInstancePollLimits: pleromaInstancePollLimits,
          maximumFileSizeInBytes: maximumFileSizeInBytes,
          markMediaAsNsfwOnAttach: markMediaAsNsfwOnAttach,
        );

  static ConversationChatPostMessageBloc createFromContext(BuildContext context,
      {@required IConversationChat conversation,
      @required List<IAccount> conversationAccountsWithoutMe}) {
    var info = ICurrentAuthInstanceBloc.of(context, listen: false)
        .currentInstance
        .info;

    return ConversationChatPostMessageBloc(
      conversation: conversation,
      conversationAccountsWithoutMe: conversationAccountsWithoutMe,
      pleromaStatusService: IPleromaStatusService.of(context, listen: false),
      statusRepository: IStatusRepository.of(context, listen: false),
      pleromaMediaAttachmentService:
          IPleromaMediaAttachmentService.of(context, listen: false),
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
      myAccount: IMyAccountBloc.of(context, listen: false).myAccount,
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    @required List<IAccount> conversationAccountsWithoutMe,
    @required IConversationChat conversation,
    @required Widget child,
  }) {
    return DisposableProvider<IPostStatusBloc>(
      create: (context) => ConversationChatPostMessageBloc.createFromContext(
        context,
        conversationAccountsWithoutMe: conversationAccountsWithoutMe,
        conversation: conversation,
      ),
      child: PostStatusMessageBlocProxyProvider(child: child),
    );
  }

  @override
  bool get isPossibleToChangeVisibility => false;

  @override
  Future<bool> actualPostStatus() async {
    var currentPostStatusData = calculateCurrentPostStatusData();

    var createdAt = DateTime.now();

    var fakeUniqueRemoteRemoteId = generateUniquePleromaFakeId();
    var localStatusAdapter = PostStatusDataStatusStatusAdapter(
      account: myAccount,
      postStatusData: currentPostStatusData,
      localId: null,
      createdAt: createdAt,
      pendingState: PendingState.pending,
      oldPendingRemoteId: fakeUniqueRemoteRemoteId,
    );

    var dbStatus = localStatusAdapter.toDbStatus(
      fakeUniqueRemoteRemoteId: fakeUniqueRemoteRemoteId,
    );
    var localStatusId = await statusRepository.insert(
      dbStatus,
    );

    await statusRepository.addStatusToConversation(
      statusRemoteId: fakeUniqueRemoteRemoteId,
      conversationRemoteId: initialData.inReplyToConversationId,
    );

    var postStatusFuture = pleromaAuthStatusService.postStatus(
      data: calculatePleromaPostStatus(),
    );

    unawaited(
      postStatusFuture.then(
        (remoteStatus) async {
          if (remoteStatus != null) {
            await statusRepository.updateById(
              localStatusId,
              mapRemoteStatusToDbStatus(
                remoteStatus,
              ).copyWith(
                oldPendingRemoteId: fakeUniqueRemoteRemoteId,
              ),
            );
            await onStatusPosted(remoteStatus);
          } else {
            await statusRepository.updateById(
              localStatusId,
              dbStatus.copyWith(
                pendingState: PendingState.fail,
              ),
            );
          }
        },
      ).catchError(
        (error) {
          statusRepository.updateById(
            localStatusId,
            dbStatus.copyWith(
              pendingState: PendingState.fail,
            ),
          );
        },
      ),
    );

    return true;
  }
}
