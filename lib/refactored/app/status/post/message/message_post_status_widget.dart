import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/status/post/post_status_bloc.dart';
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(),
        ),
        labelText: AppLocalizations.of(context)
            .tr("app.status.post.field.message.label"),
      ),
      autofocus: expanded,
      controller: postStatusBloc.inputTextController,
      minLines: null,
      maxLines: null,
      expands: expanded,
    );
  }
}
