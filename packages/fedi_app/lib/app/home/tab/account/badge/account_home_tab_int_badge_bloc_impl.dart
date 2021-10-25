import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/account/my/my_account_bloc.dart';
import 'package:fedi_app/app/home/tab/account/menu/badge/account_home_tab_menu_int_badge_bloc_impl.dart';
import 'package:fedi_app/app/instance/announcement/repository/instance_announcement_repository.dart';
import 'package:fedi_app/app/ui/badge/int/fedi_int_badge_bloc.dart';
import 'package:fedi_app/app/ui/badge/int/fedi_int_badge_bloc_sum_adapter.dart';
import 'package:flutter/widgets.dart';

class AccountHomeTabIntBadgeBloc extends DisposableOwner
    implements IFediIntBadgeBloc {
  final IMyAccountBloc myAccountBloc;
  final IInstanceAnnouncementRepository instanceAnnouncementRepository;

  final AccountHomeTabMenuIntBadgeBloc accountHomeTabMenuIntBadgeBloc;

  FediIntBadgeBlocSumAdapter? fediIntBadgeBlocSumAdapter;

  AccountHomeTabIntBadgeBloc({
    required this.myAccountBloc,
    required this.instanceAnnouncementRepository,
  }) : accountHomeTabMenuIntBadgeBloc = AccountHomeTabMenuIntBadgeBloc(
          myAccountBloc: myAccountBloc,
          instanceAnnouncementRepository: instanceAnnouncementRepository,
        ) {
    fediIntBadgeBlocSumAdapter = FediIntBadgeBlocSumAdapter(
      fediIntBadgeBlocs: [
        accountHomeTabMenuIntBadgeBloc,
      ],
    );
    addDisposable(accountHomeTabMenuIntBadgeBloc);
    addDisposable(fediIntBadgeBlocSumAdapter!);
  }

  @override
  Stream<int> get badgeStream => fediIntBadgeBlocSumAdapter!.badgeStream;

  static AccountHomeTabIntBadgeBloc createFromContext(
    BuildContext context,
  ) =>
      AccountHomeTabIntBadgeBloc(
        myAccountBloc: IMyAccountBloc.of(
          context,
          listen: false,
        ),
        instanceAnnouncementRepository: IInstanceAnnouncementRepository.of(
          context,
          listen: false,
        ),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProvider<IFediIntBadgeBloc>(
        create: AccountHomeTabIntBadgeBloc.createFromContext,
        child: child,
      );
}
