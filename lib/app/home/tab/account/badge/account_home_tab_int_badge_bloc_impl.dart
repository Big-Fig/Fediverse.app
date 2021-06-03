import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/home/tab/account/menu/badge/account_home_tab_menu_int_badge_bloc_impl.dart';
import 'package:fedi/app/ui/badge/int/fedi_int_badge_bloc.dart';
import 'package:fedi/app/ui/badge/int/fedi_int_badge_bloc_sum_adapter.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/widgets.dart';

class AccountHomeTabIntBadgeBloc extends DisposableOwner
    implements IFediIntBadgeBloc {
  final IMyAccountBloc myAccountBloc;

  final AccountHomeTabMenuIntBadgeBloc accountHomeTabMenuIntBadgeBloc;

  FediIntBadgeBlocSumAdapter? fediIntBadgeBlocSumAdapter;

  AccountHomeTabIntBadgeBloc({
    required this.myAccountBloc,
  }) : accountHomeTabMenuIntBadgeBloc = AccountHomeTabMenuIntBadgeBloc(
          myAccountBloc: myAccountBloc,
        ) {
    fediIntBadgeBlocSumAdapter = FediIntBadgeBlocSumAdapter(
      fediIntBadgeBlocs: [
        accountHomeTabMenuIntBadgeBloc,
      ],
    );
    addDisposable(disposable: accountHomeTabMenuIntBadgeBloc);
    addDisposable(disposable: fediIntBadgeBlocSumAdapter);
  }

  @override
  Stream<int> get badgeStream => fediIntBadgeBlocSumAdapter!.badgeStream;

  static AccountHomeTabIntBadgeBloc createFromContext(
    BuildContext context,
  ) {
    return AccountHomeTabIntBadgeBloc(
      myAccountBloc: IMyAccountBloc.of(context, listen: false),
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) {
    return DisposableProvider<IFediIntBadgeBloc>(
      create: (context) => AccountHomeTabIntBadgeBloc.createFromContext(
        context,
      ),
      child: child,
    );
  }
}
