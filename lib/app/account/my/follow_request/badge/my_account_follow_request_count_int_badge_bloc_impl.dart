import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/ui/badge/int/fedi_int_badge_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/widgets.dart';

class MyAccountFollowRequestCountIntBadgeBloc extends DisposableOwner
    implements IFediIntBadgeBloc {
  final IMyAccountBloc myAccountBloc;

  MyAccountFollowRequestCountIntBadgeBloc({
    @required this.myAccountBloc,
  });

  @override
  Stream<int> get badgeStream => myAccountBloc.followRequestsCountStream;

  static MyAccountFollowRequestCountIntBadgeBloc createFromContext(
    BuildContext context,
  ) {
    return MyAccountFollowRequestCountIntBadgeBloc(
      myAccountBloc: IMyAccountBloc.of(context, listen: false),
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    @required Widget child,
  }) {
    return DisposableProvider<IFediIntBadgeBloc>(
      create: (context) =>
          MyAccountFollowRequestCountIntBadgeBloc.createFromContext(
        context,
      ),
      child: child,
    );
  }
}
