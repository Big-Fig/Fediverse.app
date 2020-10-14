import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/status/post/action/post_status_post_overlay_notification.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/error/error_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef PostStatusActionCallback = Function(BuildContext context);

class PostStatusPostTextActionWidget extends StatelessWidget {
  final PostStatusActionCallback successCallback;

  PostStatusPostTextActionWidget({this.successCallback});

  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: true);

    return StreamBuilder<bool>(
        stream: postStatusBloc.isReadyToPostStream,
        initialData: postStatusBloc.isReadyToPost,
        builder: (context, snapshot) {
          var isReadyToPost = snapshot.data;

          return PleromaAsyncOperationButtonBuilderWidget(
            showProgressDialog: true,
            progressContentMessage: tr("app.status.post.dialog.async.content"),
            asyncButtonAction: () async {
              var isScheduled = postStatusBloc.isScheduled;
              var success = await postStatusBloc.post();
              if (success == true) {
                showPostStatusPostOverlayNotification(
                  context: context,
                  postStatusBloc: postStatusBloc,
                  isScheduled: isScheduled,
                );
              }
              FocusScope.of(context).requestFocus(FocusNode()); //remove focus
              if (success && successCallback != null) {
                successCallback(context);
              }
            },
            errorAlertDialogBuilders: [
              (context, error, stackTrace) {
                var isScheduled = postStatusBloc.isScheduled;
                return ErrorData(
                  error: error,
                  stackTrace: stackTrace,
                  titleText: isScheduled
                      ? tr("app.status.post.dialog.error.title.schedule")
                      : tr("app.status.post.dialog.error.title.post"),
                  contentText: tr("app.status.post.dialog.error.content",
                      args: [error.toString()]),
                );
              }
            ],
            builder: (BuildContext context, onPressed) {
              return FediPrimaryFilledTextButton(
                tr("app.status.post.action.post"),
                onPressed: isReadyToPost ? onPressed : null,
              );
            },
          );
        });
  }
}
