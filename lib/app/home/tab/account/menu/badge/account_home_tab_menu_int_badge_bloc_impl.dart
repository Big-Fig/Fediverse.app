import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/home/tab/account/menu/actions/badge/account_home_tab_menu_actions_int_badge_bloc_impl.dart';
import 'package:fedi/app/ui/badge/int/fedi_int_badge_bloc.dart';
import 'package:fedi/app/ui/badge/int/fedi_int_badge_bloc_sum_adapter.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/widgets.dart';

class AccountHomeTabMenuIntBadgeBloc extends DisposableOwner
    implements IFediIntBadgeBloc {
  final IMyAccountBloc myAccountBloc;

  final AccountHomeTabMenuActionsIntBadgeBloc
      accountHomeTabMenuActionsIntBadgeBloc;

  FediIntBadgeBlocSumAdapter? fediIntBadgeBlocSumAdapter;

  AccountHomeTabMenuIntBadgeBloc({
    required this.myAccountBloc,
  }) : accountHomeTabMenuActionsIntBadgeBloc =
            AccountHomeTabMenuActionsIntBadgeBloc(
          myAccountBloc: myAccountBloc,
        ) {
    fediIntBadgeBlocSumAdapter = FediIntBadgeBlocSumAdapter(
      fediIntBadgeBlocs: [
        accountHomeTabMenuActionsIntBadgeBloc,
      ],
    );
    addDisposable(disposable: accountHomeTabMenuActionsIntBadgeBloc);
    addDisposable(disposable: fediIntBadgeBlocSumAdapter);
  }

  @override
  Stream<int> get badgeStream => fediIntBadgeBlocSumAdapter!.badgeStream;

  static AccountHomeTabMenuIntBadgeBloc createFromContext(
    BuildContext context,
  ) {
    return AccountHomeTabMenuIntBadgeBloc(
      myAccountBloc: IMyAccountBloc.of(context, listen: false),
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) {
    return DisposableProvider<IFediIntBadgeBloc>(
      create: (context) => AccountHomeTabMenuIntBadgeBloc.createFromContext(
        context,
      ),
      child: child,
    );
  }
}
