import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:fedi/app/ui/async/fedi_async_dialog.dart';
import 'package:fedi/app/ui/edit_text/fedi_filled_edit_text_field.dart';
import 'package:fedi/dialog/alert/simple_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostMessageContentWidget extends StatelessWidget {
  final String hintText;

  const PostMessageContentWidget({
    @required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    IPostMessageBloc postMessageBloc = IPostMessageBloc.of(context);

    return FediFilledEditTextField(
      leading: null,
      hintText: hintText,
      textEditingController: postMessageBloc.inputTextController,
      expanded: false,
      autofocus: false,
      textInputAction: TextInputAction.send,
      onSubmitted: (String value) async {
        if (postMessageBloc.isReadyToPost) {
          await doAsyncOperationWithFediDialog(
              context: context,
              errorDataBuilders: PleromaAsyncOperationButtonBuilderWidget
                  .pleromaErrorDataBuilders,
              asyncCode: () {
                return postMessageBloc.post();
              });
        } else {
          await SimpleAlertDialog(
                  context: context,
                  title: tr("app.chat.post.error.empty.dialog.title"))
              .show(context);
        }
      },
      maxLines: 1,
      errorText: null,
    );
  }
}
