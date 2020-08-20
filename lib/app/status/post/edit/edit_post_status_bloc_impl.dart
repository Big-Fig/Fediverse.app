import 'package:fedi/app/status/post/edit/edit_post_status_bloc.dart';

import 'package:fedi/app/status/post/post_status_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';

class EditPostStatusBloc extends PostStatusBloc implements IEditPostStatusBloc {

  EditPostStatusBloc({
    @required IPleromaStatusService pleromaStatusService,
    @required IStatusRepository statusRepository,
    @required IPleromaMediaAttachmentService pleromaMediaAttachmentService,
  }) : super(
      pleromaStatusService: pleromaStatusService,
      statusRepository: statusRepository,
      pleromaMediaAttachmentService: pleromaMediaAttachmentService,
      initialData: PostStatusBloc.defaultInitData
          .copyWith(visibility: PleromaVisibility.DIRECT),
      initialAccountsToMention: null);

  @override
  bool get isPossibleToChangeVisibility => true;
}
