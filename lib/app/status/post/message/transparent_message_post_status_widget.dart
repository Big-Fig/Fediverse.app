import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/edit_text/fedi_transparent_edit_text_field.dart';
import 'package:fedi/dialog/alert/simple_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransparentMessagePostStatusWidget extends StatelessWidget {
  final bool expanded;
  final int maxLines;
  final String hintText;

  TransparentMessagePostStatusWidget({
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
          await postStatusBloc.postStatus();
        } else {
          await SimpleAlertDialog(
                  context: context,
                  title: tr("app.status.post.error.empty.dialog.title"))
              .show(context);
        }
      },
    );
  }
}
