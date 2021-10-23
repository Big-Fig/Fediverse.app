import 'package:fedi/app/status/post/post_status_compose_widget.dart';
import 'package:flutter/cupertino.dart';

class TimelinesHomeTabPostStatusHeaderWidget extends StatelessWidget {
  const TimelinesHomeTabPostStatusHeaderWidget({Key? key}) : super(key: key);

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
}
