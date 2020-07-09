import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_bloc_proxy_provider.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';

class NewPostStatusBloc extends PostStatusBloc {
  NewPostStatusBloc({
    @required IPleromaStatusService pleromaStatusService,
    @required IStatusRepository statusRepository,
    @required IPleromaMediaAttachmentService pleromaMediaAttachmentService,
  }) : super(
            pleromaStatusService: pleromaStatusService,
            statusRepository: statusRepository,
            pleromaMediaAttachmentService: pleromaMediaAttachmentService,
            initialVisibility: PleromaVisibility.PUBLIC);

  static NewPostStatusBloc _createFromContext(BuildContext context) =>
      NewPostStatusBloc(
          pleromaStatusService:
              IPleromaStatusService.of(context, listen: false),
          statusRepository: IStatusRepository.of(context, listen: false),
          pleromaMediaAttachmentService:
              IPleromaMediaAttachmentService.of(context, listen: false));

  static Widget provideToContext(BuildContext context,
      {@required Widget child}) {
    return DisposableProvider<IPostStatusBloc>(
      create: (context) => NewPostStatusBloc._createFromContext(
        context,
      ),
      child: PostStatusMessageBlocProxyProvider(child: child),
    );
  }

  @override
  bool get isPossibleToChangeVisibility => true;
}
