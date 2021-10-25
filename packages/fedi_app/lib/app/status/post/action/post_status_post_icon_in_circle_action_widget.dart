import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_button_builder_widget.dart';
import 'package:fedi_app/app/status/post/action/post_status_post_overlay_notification.dart';
import 'package:fedi_app/app/status/post/post_status_bloc.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_icon_in_circle_filled_button.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusPostIconInCircleActionWidget extends StatelessWidget {
  const PostStatusPostIconInCircleActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: true);

    return StreamBuilder<bool>(
      stream: postStatusBloc.isReadyToPostStream,
      initialData: postStatusBloc.isReadyToPost,
      builder: (context, snapshot) {
        var isReadyToPost = snapshot.data;

        return UnifediAsyncOperationButtonBuilderWidget(
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
          builder: (BuildContext context, onPressed) =>
              FediIconInCircleFilledButton(
            FediIcons.send,
            onPressed: isReadyToPost! ? onPressed : null,
          ),
        );
      },
    );
  }
}
