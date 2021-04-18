import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/status/post/action/post_status_post_overlay_notification.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusPostIconActionWidget extends StatelessWidget {
  const PostStatusPostIconActionWidget();

  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: true);

    return StreamBuilder<bool>(
      stream: postStatusBloc.isReadyToPostStream,
      initialData: postStatusBloc.isReadyToPost,
      builder: (context, snapshot) {
        var isReadyToPost = snapshot.data;

        return PleromaAsyncOperationButtonBuilderWidget(
          showProgressDialog: false,
          asyncButtonAction: () async {
            var isScheduled = postStatusBloc.isScheduledAtExist;
            await postStatusBloc.post();
            showPostStatusPostOverlayNotification(
              context: context,
              postStatusBloc: postStatusBloc,
              isScheduled: isScheduled,
            );
          },
          builder: (BuildContext context, onPressed) {
            return FediIconButton(
              icon: Icon(FediIcons.send),
              onPressed: isReadyToPost! ? onPressed : null,
            );
          },
        );
      },
    );
  }
}
