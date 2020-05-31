import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/edit/fedi_transparent_edit_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransparentMessagePostStatusWidget extends StatelessWidget {
  final bool expanded;
  final String hintText;

  TransparentMessagePostStatusWidget({
    @required this.expanded,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    IPostStatusBloc postStatusBloc = IPostStatusBloc.of(context);

    return FediTransparentEditTextField(
      textEditingController: postStatusBloc.inputTextController,
      focusNode: postStatusBloc.focusNode,
      hintText: hintText ??
          tr("app.status.post.field.message.hint"),
      expanded: expanded,
      autofocus: expanded,
    );
  }
}
