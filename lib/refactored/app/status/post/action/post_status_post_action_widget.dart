import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/status/post/post_status_bloc.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef PostStatusActionPostWidgetSuccessCallback(IStatus status);

class PostStatusPostActionWidget extends StatelessWidget {
  final PostStatusActionPostWidgetSuccessCallback successCallback;

  PostStatusPostActionWidget({this.successCallback});

  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: true);

    return InitialDataStreamBuilder<bool>(
        stream: postStatusBloc.isReadyToPostStream,
        initialData: postStatusBloc.isReadyToPost,
        builder: (context, snapshot) {
          var isReadyToPost = snapshot.data;

          var onPressed;

          if (isReadyToPost) {
            onPressed = () async {
              var status = await postStatusBloc.postStatus();
              if (status != null && successCallback != null) {
                successCallback(status);
              }
            };
          }

          return OutlineButton(
            child: Text(
              AppLocalizations.of(context).tr("post.quick_post.action.post"),
              style: TextStyle(color: isReadyToPost ? Colors.blue : null),
            ),
            onPressed: onPressed,
          );
        });
  }
}
