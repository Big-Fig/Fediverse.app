import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_helper.dart';
import 'package:fedi_app/app/status/post/action/post_status_post_overlay_notification.dart';
import 'package:fedi_app/app/status/post/post_status_bloc.dart';
import 'package:fedi_app/app/ui/dialog/alert/fedi_simple_alert_dialog.dart';
import 'package:fedi_app/app/ui/edit_text/fedi_transparent_edit_text_field.dart';
import 'package:fedi_app/form/form_item_validation.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusComposeInputWidget extends StatelessWidget {
  final bool expanded;
  final bool autofocus;
  final int? maxLines;
  final String? hintText;

  const PostStatusComposeInputWidget({
    Key? key,
    required this.expanded,
    required this.autofocus,
    required this.maxLines,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context);

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
          hintText:
              hintText ?? S.of(context).app_status_post_field_message_hint,
          expanded: expanded,
          autofocus: autofocus,
          maxLines: maxLines,
          textInputAction: TextInputAction.send,
          onSubmitted: (String value) async {
            if (postStatusBloc.isReadyToPost) {
              var isScheduled = postStatusBloc.isScheduledAtExist;
              var dialogResult = await UnifediAsyncOperationHelper
                  .performUnifediAsyncOperation<void>(
                context: context,
                asyncCode: () => postStatusBloc.post(),
              );
              var success = dialogResult.success;

              if (success) {
                showPostStatusPostOverlayNotification(
                  context: context,
                  postStatusBloc: postStatusBloc,
                  isScheduled: isScheduled,
                );
              }
            } else {
              if (postStatusBloc.pollBloc.isHaveAtLeastOneError) {
                await FediSimpleAlertDialog(
                  title: S.of(context).app_status_post_error_poll_dialog_title,
                ).show<void>(context);
              } else {
                await FediSimpleAlertDialog(
                  title: S.of(context).app_status_post_error_empty_dialog_title,
                ).show<void>(context);
              }
            }
          },
          errorText: errorText,
          highlightMentions: true,
          maxLength: postStatusBloc.maximumMessageLength,
        );
      },
    );
  }
}
