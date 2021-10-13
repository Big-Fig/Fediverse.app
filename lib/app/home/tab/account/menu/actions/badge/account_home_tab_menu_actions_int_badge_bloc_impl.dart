import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/my/follow_request/badge/my_account_follow_request_count_int_badge_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/ui/badge/int/fedi_int_badge_bloc.dart';
import 'package:fedi/app/ui/badge/int/fedi_int_badge_bloc_sum_adapter.dart';
import 'package:flutter/widgets.dart';

class AccountHomeTabMenuActionsIntBadgeBloc extends DisposableOwner
    implements IFediIntBadgeBloc {
  final IMyAccountBloc myAccountBloc;

  final MyAccountFollowRequestCountIntBadgeBloc followRequestCountIntBadgeBloc;

  FediIntBadgeBlocSumAdapter? fediIntBadgeBlocSumAdapter;

  AccountHomeTabMenuActionsIntBadgeBloc({
    required this.myAccountBloc,
  }) : followRequestCountIntBadgeBloc = MyAccountFollowRequestCountIntBadgeBloc(
          myAccountBloc: myAccountBloc,
        ) {
    fediIntBadgeBlocSumAdapter = FediIntBadgeBlocSumAdapter(
      fediIntBadgeBlocs: [
        followRequestCountIntBadgeBloc,
      ],
    );
    addDisposable(followRequestCountIntBadgeBloc);
    addDisposable(fediIntBadgeBlocSumAdapter!);
  }

  @override
  Stream<int> get badgeStream => fediIntBadgeBlocSumAdapter!.badgeStream;

  static AccountHomeTabMenuActionsIntBadgeBloc createFromContext(
    BuildContext context,
  ) =>
      AccountHomeTabMenuActionsIntBadgeBloc(
        myAccountBloc: IMyAccountBloc.of(context, listen: false),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProvider<IFediIntBadgeBloc>(
        create: (context) =>
            AccountHomeTabMenuActionsIntBadgeBloc.createFromContext(
          context,
        ),
        child: child,
      );
}
