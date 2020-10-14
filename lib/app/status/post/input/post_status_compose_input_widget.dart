import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/async/pleroma_async_operation_helper.dart';
import 'package:fedi/app/status/post/action/post_status_post_overlay_notification.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_simple_alert_dialog.dart';
import 'package:fedi/app/ui/edit_text/fedi_transparent_edit_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusComposeInputWidget extends StatelessWidget {
  final bool expanded;
  final bool autofocus;
  final int maxLines;
  final String hintText;

  PostStatusComposeInputWidget({
    @required this.expanded,
    @required this.autofocus,
    @required this.maxLines,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    IPostStatusBloc postStatusBloc = IPostStatusBloc.of(context);

    return FediTransparentEditTextField(
      textEditingController: postStatusBloc.inputTextController,
      focusNode: postStatusBloc.inputFocusNode,
      hintText: hintText ?? tr("app.status.post.field.message.hint"),
      expanded: expanded,
      autofocus: autofocus,
      maxLines: maxLines,
      textInputAction: TextInputAction.send,
      onSubmitted: (String value) async {
        if (postStatusBloc.isReadyToPost) {
          var isScheduled = postStatusBloc.isScheduled;
          var dialogResult =
              await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
            context: context,
            asyncCode: () => postStatusBloc.post(),
          );
          var success = dialogResult.result;

          if (success) {
            showPostStatusPostOverlayNotification(
              context: context,
              postStatusBloc: postStatusBloc,
              isScheduled: isScheduled,
            );
          }
        } else {
          await FediSimpleAlertDialog(
                  context: context,
                  title: tr("app.status.post.error.empty.dialog.title"))
              .show(context);
        }
      },
      errorText: null,
      highlightMentions: true,
      maxLength: postStatusBloc.maximumMessageLength,
    );
  }
}
