import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/account/my/my_account_bloc.dart';
import 'package:fedi_app/app/ui/badge/int/fedi_int_badge_bloc.dart';
import 'package:flutter/widgets.dart';

class MyAccountFollowRequestCountIntBadgeBloc extends DisposableOwner
    implements IFediIntBadgeBloc {
  final IMyAccountBloc myAccountBloc;

  MyAccountFollowRequestCountIntBadgeBloc({
    required this.myAccountBloc,
  });

  @override
  Stream<int> get badgeStream =>
      myAccountBloc.followRequestsCountStream.map((count) => count ?? 0);

  static MyAccountFollowRequestCountIntBadgeBloc createFromContext(
    BuildContext context,
  ) =>
      MyAccountFollowRequestCountIntBadgeBloc(
        myAccountBloc: IMyAccountBloc.of(context, listen: false),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProvider<IFediIntBadgeBloc>(
        create: MyAccountFollowRequestCountIntBadgeBloc.createFromContext,
        child: child,
      );
}
