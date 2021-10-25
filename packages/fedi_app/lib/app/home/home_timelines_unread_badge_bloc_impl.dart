import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/home/home_bloc.dart';
import 'package:fedi_app/app/ui/badge/bool/fedi_bool_badge_bloc.dart';

class HomeTimelinesUnreadBadgeBloc extends DisposableOwner
    implements IFediBoolBadgeBloc {
  final IHomeBloc homeBloc;

  HomeTimelinesUnreadBadgeBloc({required this.homeBloc});

  @override
  Stream<bool> get badgeStream => homeBloc.isTimelinesUnreadStream;
}
