import 'package:fedi/app/status/post/post_status_compose_widget.dart';
import 'package:flutter/cupertino.dart';

class TimelinesHomeTabPostStatusHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const PostStatusComposeWidget(
        autofocus: false,
        expanded: false,
        goBackOnSuccess: false,
        displayAccountAvatar: true,
        maxLines: null,
        showPostAction: true,
        displaySubjectField: false,
      );

  const TimelinesHomeTabPostStatusHeaderWidget();
}
