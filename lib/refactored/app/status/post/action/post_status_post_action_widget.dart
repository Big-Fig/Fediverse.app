import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/refactored/app/status/post/post_status_bloc.dart';
import 'package:fedi/refactored/dialog/alert/simple_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

typedef IPostStatusCallback(BuildContext context);

class PostStatusPostActionWidget extends StatelessWidget {
  final IPostStatusCallback successCallback;

  PostStatusPostActionWidget({this.successCallback});

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
            progressContentMessage: AppLocalizations.of(context)
                .tr("app.status.post.dialog.async.content"),
            asyncButtonAction: () async {
              var success = await postStatusBloc.postStatus();
              if (success) {
                Fluttertoast.showToast(
                    msg: AppLocalizations.of(context)
                        .tr("app.status.post.toast.success"),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
              if (success && successCallback != null) {
                successCallback(context);
              }
            },
            errorAlertDialogBuilders: [
              (context, error) => SimpleAlertDialog(
                  title: AppLocalizations.of(context)
                      .tr("app.status.post.dialog.error.title"),
                  content: AppLocalizations.of(context).tr(
                      "app.status.post.dialog.error.content",
                      args: [error.toString()]),
                  context: context)
            ],
            builder: (BuildContext context, onPressed) {
              return OutlineButton(
                child: Text(
                  AppLocalizations.of(context)
                      .tr("app.status.post.action.post"),
                  style: TextStyle(color: isReadyToPost ? Colors.blue : null),
                ),
                onPressed: isReadyToPost ? onPressed : null,
              );
            },
          );
        });
  }
}
