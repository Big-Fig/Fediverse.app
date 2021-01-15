import 'package:fedi/app/status/post/poll/post_status_poll_bloc.dart';
import 'package:fedi/app/ui/badge/bool/fedi_bool_badge_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';

class PostStatusPollActionBadgeBloc extends DisposableOwner
    implements IFediBoolBadgeBloc {
  final IPostStatusPollBloc postStatusPollBloc;

  PostStatusPollActionBadgeBloc({
    @required this.postStatusPollBloc,
  });

  @override
  Stream<bool> get badgeStream =>
      postStatusPollBloc.pollOptionsGroupBloc.itemsStream
          .map((items) => items?.isNotEmpty == true);
}
