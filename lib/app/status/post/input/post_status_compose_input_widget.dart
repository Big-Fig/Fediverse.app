import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/status/post/action/post_status_post_overlay_notification.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/async/fedi_async_dialog.dart';
import 'package:fedi/app/ui/edit_text/fedi_transparent_edit_text_field.dart';
import 'package:fedi/dialog/alert/simple_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusComposeInputWidget extends StatelessWidget {
  final bool expanded;
  final int maxLines;
  final String hintText;

  PostStatusComposeInputWidget({
    @required this.expanded,
    @required this.maxLines,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    IPostStatusBloc postStatusBloc = IPostStatusBloc.of(context);

    return FediTransparentEditTextField(
      textEditingController: postStatusBloc.inputTextController,
      focusNode: postStatusBloc.focusNode,
      hintText: hintText ?? tr("app.status.post.field.message.hint"),
      expanded: expanded,
      autofocus: expanded,
      maxLines: maxLines,
      textInputAction: TextInputAction.send,
      onSubmitted: (String value) async {
        if (postStatusBloc.isReadyToPost) {
          var dialogResult = await doAsyncOperationWithFediDialog(
              context: context,
              errorDataBuilders: [
                ...PleromaAsyncOperationButtonBuilderWidget
                    .pleromaErrorDataBuilders
              ],
              asyncCode: () => postStatusBloc.post());
          var success = dialogResult.result;
          if (success) {
            showPostStatusPostOverlayNotification(context, postStatusBloc);
          }
        } else {
          await SimpleAlertDialog(
                  context: context,
                  title: tr("app.status.post.error.empty.dialog.title"))
              .show(context);
        }
      },
      errorText: null,
    );
  }
}
