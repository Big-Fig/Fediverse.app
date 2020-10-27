import 'package:fedi/app/async/pleroma_async_operation_helper.dart';
import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_simple_alert_dialog.dart';
import 'package:fedi/app/ui/edit_text/fedi_filled_edit_text_field.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostMessageContentWidget extends StatelessWidget {
  final String hintText;
  final bool expanded;
  final Widget ending;
  final bool filled;

  const PostMessageContentWidget({
    @required this.hintText,
    this.expanded = false,
    this.ending,
    this.filled = true,
  });

  @override
  Widget build(BuildContext context) {
    IPostMessageBloc postMessageBloc = IPostMessageBloc.of(context);

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
          await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
              context: context,
              asyncCode: () {
                return postMessageBloc.post();
              });
        } else {
          await FediSimpleAlertDialog(
            context: context,
            title: S.of(context).app_chat_post_error_empty_dialog_title,
          ).show(context);
        }
      },
      maxLines: null,
      // maxLines: 1,
      errorText: null,
      highlightMentions: true,
      maxLength: postMessageBloc.maximumMessageLength,
    );
  }
}
