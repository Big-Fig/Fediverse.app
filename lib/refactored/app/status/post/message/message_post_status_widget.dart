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
        // todo: localization
        labelText: "Message",
      ),
      autofocus: expanded ? true : null,
      controller: postStatusBloc.inputTextController,
      minLines: expanded ? null : null,
      maxLines: expanded ? null : null,
      expands: expanded ? true : null,
    );
  }
}
