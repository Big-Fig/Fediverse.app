import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/chat/post/chat_post_message_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_filled_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusPostTextActionWidget extends StatelessWidget {
  const PostStatusPostTextActionWidget();

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
              await postStatusBloc.postStatus();
            },
            builder: (BuildContext context, onPressed) {
              return FediIconInCircleFilledButton(
                FediIcons.send,
                onPressed: isReadyToPost ? onPressed : null,
              );
            },
          );
        });
  }
}
