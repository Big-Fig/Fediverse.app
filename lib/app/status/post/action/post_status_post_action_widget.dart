import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/dialog/alert/simple_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

typedef IPostStatusCallback = Function(BuildContext context);

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
              var isScheduled = postStatusBloc.isScheduled;
              var success = await postStatusBloc.postStatus();
              if (success) {
                await Fluttertoast.showToast(
                    msg: isScheduled
                        ? AppLocalizations.of(context)
                            .tr("app.status.post.toast.success.schedule")
                        : AppLocalizations.of(context)
                            .tr("app.status.post.toast.success.post"),
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
              (context, error) {
                var isScheduled = postStatusBloc.isScheduled;
                return SimpleAlertDialog(
                    title: isScheduled
                        ? AppLocalizations.of(context)
                            .tr("app.status.post.dialog.error.title.schedule")
                        : AppLocalizations.of(context)
                            .tr("app.status.post.dialog.error.title.post"),
                    content: AppLocalizations.of(context).tr(
                        "app.status.post.dialog.error.content",
                        args: [error.toString()]),
                    context: context);
              }
            ],
            builder: (BuildContext context, onPressed) {
              return FediPrimaryFilledTextButton(
                AppLocalizations.of(context).tr("app.status.post.action.post"),
                onPressed: isReadyToPost ? onPressed : null,
              );
            },
          );
        });
  }
}
