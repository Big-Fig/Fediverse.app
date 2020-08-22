import 'package:fedi/app/status/post/post_status_compose_widget.dart';
import 'package:fedi/ui/scroll/unfocus_on_scroll_area_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditPostStatusWidget extends StatelessWidget {
  EditPostStatusWidget();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: UnfocusOnScrollAreaWidget(
            child: PostStatusComposeWidget(
              goBackOnSuccess: true,
              expanded: true,
              maxLines: null,
              displayAccountAvatar: false,
              showPostAction: true,
              displaySubjectField: true,
            ),
          ),
        ),
      ],
    );
  }
}
