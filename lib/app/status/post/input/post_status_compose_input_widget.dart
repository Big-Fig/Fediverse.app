import 'package:fedi/form/form_item_validation.dart';
import 'package:fedi/generated/l10n.dart';
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
  final int? maxLines;
  final String? hintText;

  PostStatusComposeInputWidget({
    required this.expanded,
    required this.autofocus,
    required this.maxLines,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    IPostStatusBloc postStatusBloc = IPostStatusBloc.of(context);

    return StreamBuilder<List<FormItemValidationError>>(
      stream: postStatusBloc.inputTextErrorsStream,
      builder: (context, snapshot) {

        var inputTextErrors = snapshot.data;

        String? errorText;

        if (inputTextErrors?.isNotEmpty == true) {
          errorText = inputTextErrors!.first.createErrorDescription(context);
        }
        return FediTransparentEditTextField(
          textEditingController: postStatusBloc.inputTextController,
          focusNode: postStatusBloc.inputFocusNode,
          hintText: hintText ?? S.of(context).app_status_post_field_message_hint,
          expanded: expanded,
          autofocus: autofocus,
          maxLines: maxLines,
          textInputAction: TextInputAction.send,
          onSubmitted: (String value) async {
            if (postStatusBloc.isReadyToPost) {
              var isScheduled = postStatusBloc.isScheduledAtExist;
              var dialogResult =
                  await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
                context: context,
                asyncCode: () => postStatusBloc.post(),
              );
              var success = dialogResult.result!;

              if (success) {
                showPostStatusPostOverlayNotification(
                  context: context,
                  postStatusBloc: postStatusBloc,
                  isScheduled: isScheduled,
                );
              }
            } else {

              if(postStatusBloc.pollBloc!.isHaveAtLeastOneError) {
                await FediSimpleAlertDialog(
                    context: context,

                title: S.of(context).app_status_post_error_poll_dialog_title)
                    .show(context);
              } else {
                await FediSimpleAlertDialog(
                    context: context,

                title: S.of(context).app_status_post_error_empty_dialog_title)
                    .show(context);
              }

            }
          },
          errorText: errorText,
          highlightMentions: true,
          maxLength: postStatusBloc.maximumMessageLength,
        );
      }
    );
  }
}
