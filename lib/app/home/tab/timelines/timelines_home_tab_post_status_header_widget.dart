import 'package:fedi/app/media/attachment/upload/upload_media_attachments_collection_bloc.dart';
import 'package:fedi/app/status/post/new/new_post_status_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_compose_widget.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class TimelinesHomeTabPostStatusHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => DisposableProvider<IPostStatusBloc>(
        create: (context) => NewPostStatusBloc.createFromContext(context),
        child: ProxyProvider<IPostStatusBloc,
            IUploadMediaAttachmentsCollectionBloc>(
          update: (context, value, previous) =>
          value.mediaAttachmentsBloc,
          child: Container(
            color: FediColors.offWhite,
            child: PostStatusComposeWidget(
              expanded: false,
              goBackOnSuccess: false,
              displayAccountAvatar: true,
              maxLines: 1,
            ),
          ),
        ),
      );

  const TimelinesHomeTabPostStatusHeaderWidget();
}
