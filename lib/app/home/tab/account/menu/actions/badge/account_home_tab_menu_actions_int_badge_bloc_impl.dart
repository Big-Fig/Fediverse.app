import 'package:fedi/app/account/my/follow_request/badge/my_account_follow_request_count_int_badge_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/ui/badge/int/fedi_int_badge_bloc.dart';
import 'package:fedi/app/ui/badge/int/fedi_int_badge_bloc_sum_adapter.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
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
    addDisposable(disposable: followRequestCountIntBadgeBloc);
    addDisposable(disposable: fediIntBadgeBlocSumAdapter);
  }

  @override
  Stream<int> get badgeStream => fediIntBadgeBlocSumAdapter!.badgeStream;

  static AccountHomeTabMenuActionsIntBadgeBloc createFromContext(
    BuildContext context,
  ) {
    return AccountHomeTabMenuActionsIntBadgeBloc(
      myAccountBloc: IMyAccountBloc.of(context, listen: false),
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) {
    return DisposableProvider<IFediIntBadgeBloc>(
      create: (context) =>
          AccountHomeTabMenuActionsIntBadgeBloc.createFromContext(
        context,
      ),
      child: child,
    );
  }
}
