import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_bloc_proxy_provider.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';

class ConversationChatPostMessageBloc extends PostStatusBloc {
  final IConversationChat conversation;
  final List<IAccount> conversationAccountsWithoutMe;

  ConversationChatPostMessageBloc({
    @required this.conversation,
    @required this.conversationAccountsWithoutMe,
    @required IPleromaStatusService pleromaStatusService,
    @required IStatusRepository statusRepository,
    @required IPleromaMediaAttachmentService pleromaMediaAttachmentService,
    @required int maximumMessageLength,
    @required PleromaInstancePollLimits pleromaInstancePollLimits,
    @required int maximumFileSizeInBytes,
    @required bool markMediaAsNsfwOnAttach,
    @required String language,
  }) : super(
          pleromaAuthStatusService: pleromaStatusService,
          statusRepository: statusRepository,
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
          .defaultStatusLocale?.localeString,
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
}
