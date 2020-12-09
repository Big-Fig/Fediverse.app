import 'package:fedi/app/status/post/new/new_post_status_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_compose_widget.dart';
import 'package:flutter/cupertino.dart';

class TimelinesHomeTabPostStatusHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NewPostStatusBloc.provideToContext(
      context,
      child: PostStatusComposeWidget(
        autofocus: false,
        expanded: false,
        goBackOnSuccess: false,
        displayAccountAvatar: true,
        maxLines: null,
        showPostAction: true,
        displaySubjectField: false,
      ),
    );
  }

  const TimelinesHomeTabPostStatusHeaderWidget();
}
