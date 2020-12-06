import 'package:fedi/app/status/post/post_status_compose_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditPostStatusWidget extends StatelessWidget {
  const EditPostStatusWidget();

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: PostStatusComposeWidget(
            autofocus: false,
            goBackOnSuccess: true,
            expanded: true,
            maxLines: null,
            displayAccountAvatar: false,
            showPostAction: true,
            displaySubjectField: true,
          ),
        ),
      ],
    );
  }
}
