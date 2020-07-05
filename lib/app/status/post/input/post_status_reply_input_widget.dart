import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/status/post/action/post_status_attach_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_emoji_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_post_icon_action_widget.dart';
import 'package:fedi/app/status/post/action/post_status_post_overlay_notification.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/edit_text/fedi_filled_edit_text_field.dart';
import 'package:fedi/dialog/alert/simple_alert_dialog.dart';
import 'package:fedi/dialog/async/async_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusReplyInputWidget extends StatelessWidget {
  final bool expanded;
  final String hintText;
  final int maxLines;

  PostStatusReplyInputWidget({
    @required this.expanded,
    @required this.maxLines,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    IPostStatusBloc postStatusBloc = IPostStatusBloc.of(context);

    return Row(
      children: [
        StreamBuilder<String>(
            stream: postStatusBloc.inputWithoutMentionedAcctsTextStream,
            initialData: postStatusBloc.inputWithoutMentionedAcctsText,
            builder: (context, snapshot) {
              var inputWithoutMentionedAcctsText = snapshot.data;
              if (inputWithoutMentionedAcctsText?.trim()?.isNotEmpty == true) {
                return PostStatusEmojiActionWidget();
              } else {
                return PostStatusAttachActionWidget();
              }
            }),
        Flexible(
          child: FediFilledEditTextField(
            focusNode: postStatusBloc.focusNode,
            hintText: hintText ?? tr("app.status.post.field.message.hint"),
            textEditingController: postStatusBloc.inputTextController,
            expanded: expanded,
            autofocus: expanded,
            maxLines: maxLines,
            textInputAction: TextInputAction.send,
            onSubmitted: (String value) async {
              if (postStatusBloc.isReadyToPost) {
                var dialogResult = await doAsyncOperationWithDialog(
                    context: context,
                    errorDataBuilders: [
                      ...PleromaAsyncOperationButtonBuilderWidget
                          .pleromaErrorDataBuilders
                    ],
                    asyncCode: () => postStatusBloc.postStatus());
                var success = dialogResult.result;
                if (success) {
                  showPostStatusPostOverlayNotification(
                      context, postStatusBloc);
                }
              } else {
                await SimpleAlertDialog(
                        context: context,
                        title: tr("app.status.post.error.empty.dialog.title"))
                    .show(context);
              }
            },
            ending: null,
            errorText: null,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        PostStatusPostTextActionWidget(),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
