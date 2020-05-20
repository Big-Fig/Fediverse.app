import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/conversation/conversation_model.dart';
import 'package:fedi/app/status/post/post_status_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
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
