import 'package:fedi/refactored/app/status/post/post_status_bloc_impl.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/refactored/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';

class ThreadPostStatusBloc extends PostStatusBloc {
  final IStatus inReplyToStatus;
  ThreadPostStatusBloc({
    @required this.inReplyToStatus,
    @required IPleromaStatusService pleromaStatusService,
    @required IStatusRepository statusRepository,
    @required IPleromaMediaAttachmentService pleromaMediaAttachmentService,
  }) : super(
            inReplyToStatusRemoteId: inReplyToStatus.remoteId,
            pleromaStatusService: pleromaStatusService,
            statusRepository: statusRepository,
            pleromaMediaAttachmentService: pleromaMediaAttachmentService,
            initialVisibility: PleromaVisibility.PUBLIC,
            initialAccountsToMention: [inReplyToStatus.account]);

  static ThreadPostStatusBloc createFromContext(BuildContext context,
          {@required IStatus inReplyToStatus}) =>
      ThreadPostStatusBloc(
          inReplyToStatus: inReplyToStatus,
          pleromaStatusService:
              IPleromaStatusService.of(context, listen: false),
          statusRepository: IStatusRepository.of(context, listen: false),
          pleromaMediaAttachmentService:
              IPleromaMediaAttachmentService.of(context, listen: false));

  @override
  bool get isPossibleToChangeVisibility => false;
}
