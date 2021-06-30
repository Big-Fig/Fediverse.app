import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/home/tab/account/menu/actions/badge/account_home_tab_menu_actions_int_badge_bloc_impl.dart';
import 'package:fedi/app/instance/announcement/badge/instance_announcement_count_int_badge_bloc_impl.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository.dart';
import 'package:fedi/app/ui/badge/int/fedi_int_badge_bloc.dart';
import 'package:fedi/app/ui/badge/int/fedi_int_badge_bloc_sum_adapter.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:flutter/widgets.dart';

class AccountHomeTabMenuIntBadgeBloc extends DisposableOwner
    implements IFediIntBadgeBloc {
  final IMyAccountBloc myAccountBloc;
  final IInstanceAnnouncementRepository instanceAnnouncementRepository;

  final AccountHomeTabMenuActionsIntBadgeBloc
      accountHomeTabMenuActionsIntBadgeBloc;
  final InstanceAnnouncementCountIntBadgeBloc
      instanceAnnouncementCountIntBadgeBloc;

  FediIntBadgeBlocSumAdapter? fediIntBadgeBlocSumAdapter;

  AccountHomeTabMenuIntBadgeBloc({
    required this.myAccountBloc,
    required this.instanceAnnouncementRepository,
  })   : accountHomeTabMenuActionsIntBadgeBloc =
            AccountHomeTabMenuActionsIntBadgeBloc(
          myAccountBloc: myAccountBloc,
        ),
        instanceAnnouncementCountIntBadgeBloc =
            InstanceAnnouncementCountIntBadgeBloc(
          instanceAnnouncementRepository: instanceAnnouncementRepository,
        ) {
    fediIntBadgeBlocSumAdapter = FediIntBadgeBlocSumAdapter(
      fediIntBadgeBlocs: [
        accountHomeTabMenuActionsIntBadgeBloc,
        instanceAnnouncementCountIntBadgeBloc,
      ],
    );
    addDisposable(instanceAnnouncementCountIntBadgeBloc);
    addDisposable(accountHomeTabMenuActionsIntBadgeBloc);
    addDisposable(fediIntBadgeBlocSumAdapter!);
  }

  @override
  Stream<int> get badgeStream => fediIntBadgeBlocSumAdapter!.badgeStream;

  static AccountHomeTabMenuIntBadgeBloc createFromContext(
    BuildContext context,
  ) {
    return AccountHomeTabMenuIntBadgeBloc(
      myAccountBloc: IMyAccountBloc.of(context, listen: false),
      instanceAnnouncementRepository: IInstanceAnnouncementRepository.of(
        context,
        listen: false,
      ),
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
