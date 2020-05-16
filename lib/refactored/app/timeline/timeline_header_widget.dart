import 'package:fedi/refactored/app/status/post/new/new_post_status_bloc_impl.dart';
import 'package:fedi/refactored/app/status/post/post_status_bloc.dart';
import 'package:fedi/refactored/app/status/post/post_status_widget.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';

class TimelineHeaderWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) => DisposableProvider<IPostStatusBloc>(
      create: (context) => NewPostStatusBloc.createFromContext(context),
      child: const Padding(padding: EdgeInsets.all(8.0),
        child: PostStatusWidget(expanded: false,
          displayMentions: false,
          goBackOnSuccess: false,
          displayAccountAvatar: true,),),);

  const TimelineHeaderWidget();

}