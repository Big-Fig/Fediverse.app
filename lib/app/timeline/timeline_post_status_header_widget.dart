import 'package:fedi/app/status/post/new/new_post_status_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';

class TimelinePostStatusHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => DisposableProvider<IPostStatusBloc>(
        create: (context) => NewPostStatusBloc.createFromContext(context),
        child: PostStatusWidget(
          expanded: false,
          displayMentions: false,
          goBackOnSuccess: false,
          displayAccountAvatar: true,
          maxLines: 1,
        ),
      );

  const TimelinePostStatusHeaderWidget();
}
