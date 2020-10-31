import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/follower/account_follower_account_list_page.dart';
import 'package:fedi/app/account/header/account_header_statistic_widget.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class AccountHeaderFollowersCountWidget extends StatelessWidget {
  final bool dark;

  const AccountHeaderFollowersCountWidget({@required this.dark});

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);

    return StreamBuilder<int>(
        stream: accountBloc.followersCountStream,
        initialData: accountBloc.followersCount,
        builder: (context, snapshot) {
          var followersCount = snapshot.data;
          return AccountHeaderStatisticWidget(
            label: S.of(context).app_account_info_followers,
            onClick: (context) {
              goToAccountFollowerAccountListPage(context, accountBloc.account);
            },
            dark: dark,
            value: followersCount,
          );
        });
  }
}
