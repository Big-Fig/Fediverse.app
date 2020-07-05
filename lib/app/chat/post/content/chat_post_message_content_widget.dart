import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/chat/post/chat_post_message_bloc.dart';
import 'package:fedi/app/ui/edit_text/fedi_filled_edit_text_field.dart';
import 'package:fedi/dialog/alert/simple_alert_dialog.dart';
import 'package:fedi/dialog/async/async_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPostMessageContentWidget extends StatelessWidget {
  const ChatPostMessageContentWidget();

  @override
  Widget build(BuildContext context) {
    IChatPostMessageBloc chatPostMessageBloc = IChatPostMessageBloc.of(context);

    return FediFilledEditTextField(
      leading: null,
      hintText: tr("app.chat.post.field.content.hint"),
      textEditingController: chatPostMessageBloc.inputTextController,
      expanded: false,
      autofocus: false,
      textInputAction: TextInputAction.send,
      onSubmitted: (String value) async {
        if (chatPostMessageBloc.isReadyToPost) {
          await doAsyncOperationWithDialog(
              context: context,
              errorDataBuilders: PleromaAsyncOperationButtonBuilderWidget
                  .pleromaErrorDataBuilders,
              asyncCode: () {
                return chatPostMessageBloc.postMessage();
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
