import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/status/post/post_status_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
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
  }) : super(
            pleromaStatusService: pleromaStatusService,
            statusRepository: statusRepository,
            pleromaMediaAttachmentService: pleromaMediaAttachmentService,
            initialVisibility: PleromaVisibility.DIRECT,
            initialAccountsToMention: conversationAccountsWithoutMe);

  static PostStatusStartConversationBloc createFromContext(BuildContext context,
          {@required List<IAccount> conversationAccountsWithoutMe}) =>
      PostStatusStartConversationBloc(
          conversationAccountsWithoutMe: conversationAccountsWithoutMe,
          pleromaStatusService:
              IPleromaStatusService.of(context, listen: false),
          statusRepository: IStatusRepository.of(context, listen: false),
          pleromaMediaAttachmentService:
              IPleromaMediaAttachmentService.of(context, listen: false));
  @override
  bool get isPossibleToChangeVisibility => false;

  @override
  bool get isReadyToPost =>
      super.isReadyToPost && mentionedAccts?.isNotEmpty == true;

  @override
  Stream<bool> get isReadyToPostStream => Rx.combineLatest4(
      inputWithoutMentionedAcctsTextStream,
      mediaAttachmentsBloc.mediaAttachmentBlocsStream,
      mediaAttachmentsBloc.isAllAttachedMediaUploadedStream,
      mentionedAcctsStream,
      (inputWithoutMentionedAcctsText, mediaAttachmentBlocs,
              isAllAttachedMediaUploaded, mentionedAccts) =>
          calculateIsReadyToPost(
              inputText: inputWithoutMentionedAcctsText,
              mediaAttachmentBlocs: mediaAttachmentBlocs,
              isAllAttachedMediaUploaded: isAllAttachedMediaUploaded) &&
          mentionedAccts?.isNotEmpty == true);
}
