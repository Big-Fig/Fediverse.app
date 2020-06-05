import 'package:fedi/app/home/home_bloc.dart';
import 'package:fedi/app/ui/badge/fedi_unread_badge_widget.dart';
import 'package:flutter/cupertino.dart';

class HomeTimelinesUnreadBadgeWidget extends FediUnreadBadgeWidget {
  const HomeTimelinesUnreadBadgeWidget(
      {@required Widget child, double offset = 2.0})
      : super(child: child, offset: offset);

  @override
  Stream<bool> retrieveUnreadBadgeCountStream(BuildContext context) {
    var homeBloc = IHomeBloc.of(context, listen: false);

    return homeBloc.isTimelinesUnreadStream;
  }
}
