import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/app/status/post/post_status_bloc_impl.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/refactored/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';

class ConversationPostStatusBloc extends PostStatusBloc {
  final IConversation conversation;
  final List<IAccount> conversationAccountsWithoutMe;
  ConversationPostStatusBloc({
    @required this.conversation,
    @required this.conversationAccountsWithoutMe,
    @required IPleromaStatusService pleromaStatusService,
    @required IStatusRepository statusRepository,
    @required IPleromaMediaAttachmentService pleromaMediaAttachmentService,
  }) : super(
            conversationRemoteId: conversation.remoteId,
            pleromaStatusService: pleromaStatusService,
            statusRepository: statusRepository,
            pleromaMediaAttachmentService: pleromaMediaAttachmentService,
            initialVisibility: PleromaVisibility.PRIVATE,
            initialAccountsToMention: conversationAccountsWithoutMe);

  static ConversationPostStatusBloc createFromContext(BuildContext context,
          {@required IConversation conversation,
          @required List<IAccount> conversationAccountsWithoutMe}) =>
      ConversationPostStatusBloc(
          conversation: conversation,
          conversationAccountsWithoutMe: conversationAccountsWithoutMe,
          pleromaStatusService:
              IPleromaStatusService.of(context, listen: false),
          statusRepository: IStatusRepository.of(context, listen: false),
          pleromaMediaAttachmentService:
              IPleromaMediaAttachmentService.of(context, listen: false));

  @override
  bool get isPossibleToChangeVisibility => false;
}
