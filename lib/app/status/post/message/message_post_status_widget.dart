import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessagePostStatusWidget extends StatelessWidget {
  final bool expanded;

  MessagePostStatusWidget({@required this.expanded});

  @override
  Widget build(BuildContext context) {
    IPostStatusBloc postStatusBloc = IPostStatusBloc.of(context);

    return TextField(
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: AppLocalizations.of(context)
              .tr("app.status.post.field.message.hint"),
          hintStyle: TextStyle(fontSize: 18.0, color: FediColors.lightGrey)),
      style: TextStyle(fontSize: 18.0, color: FediColors.darkGrey),
      autofocus: expanded,
      controller: postStatusBloc.inputTextController,
      minLines: null,
      maxLines: null,
      expands: expanded,
    );
  }
}
