import 'package:fedi/app/async/pleroma/pleroma_async_operation_helper.dart';
import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_simple_alert_dialog.dart';
import 'package:fedi/app/ui/edit_text/fedi_filled_edit_text_field.dart';
import 'package:fedi/form/form_item_validation.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostMessageContentWidget extends StatelessWidget {
  final String hintText;
  final bool expanded;
  final Widget? ending;
  final bool filled;

  const PostMessageContentWidget({
    required this.hintText,
    this.expanded = false,
    this.ending,
    this.filled = true,
  });

  @override
  Widget build(BuildContext context) {
    var postMessageBloc = IPostMessageBloc.of(context);

    return StreamBuilder<List<FormItemValidationError>>(
      stream: postMessageBloc.inputTextErrorsStream,
      builder: (context, snapshot) {
        var inputTextErrors = snapshot.data;

        String? errorText;

        if (inputTextErrors?.isNotEmpty == true) {
          errorText = inputTextErrors!.first.createErrorDescription(context);
        }

        return FediFilledEditTextField(
          filled: filled,
          leading: null,
          hintText: hintText,
          textEditingController: postMessageBloc.inputTextController,
          focusNode: postMessageBloc.inputFocusNode,
          expanded: expanded,
          ending: ending,
          autofocus: false,
          textInputAction: TextInputAction.send,
          onSubmitted: (String value) async {
            if (postMessageBloc.isReadyToPost) {
              await PleromaAsyncOperationHelper.performPleromaAsyncOperation<
                  void>(
                context: context,
                asyncCode: () {
                  return postMessageBloc.post();
                },
              );
            } else {
              await FediSimpleAlertDialog(
                title: S.of(context).app_chat_post_error_empty_dialog_title,
              ).show<void>(context);
            }
          },
          maxLines: null,
          // maxLines: 1,
          errorText: errorText,
          highlightMentions: true,
          maxLength: postMessageBloc.maximumMessageLength,
        );
      },
    );
  }
}
