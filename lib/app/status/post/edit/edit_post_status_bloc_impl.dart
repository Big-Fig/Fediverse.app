import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_bloc_proxy_provider.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:flutter/widgets.dart';

class EditPostStatusBloc extends PostStatusBloc {
  EditPostStatusBloc({
    @required IPleromaStatusService pleromaStatusService,
    @required IStatusRepository statusRepository,
    @required IPleromaMediaAttachmentService pleromaMediaAttachmentService,
    @required IPostStatusData initialData,
  }) : super(
          pleromaStatusService: pleromaStatusService,
          statusRepository: statusRepository,
          pleromaMediaAttachmentService: pleromaMediaAttachmentService,
          initialData: initialData,
        );

  static EditPostStatusBloc createFromContext(
    BuildContext context, {
    @required IPostStatusData initialData,
  }) =>
      EditPostStatusBloc(
        pleromaStatusService: IPleromaStatusService.of(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        pleromaMediaAttachmentService:
            IPleromaMediaAttachmentService.of(context, listen: false),
        initialData: initialData,
      );

  static Widget provideToContext(
    BuildContext context, {
    @required Widget child,
    @required IPostStatusData initialData,
  }) {
    return DisposableProvider<IPostStatusBloc>(
      create: (context) => EditPostStatusBloc.createFromContext(
        context,
        initialData: initialData,
      ),
      child: PostStatusMessageBlocProxyProvider(child: child),
    );
  }

  @override
  bool get isPossibleToChangeVisibility => true;
}
