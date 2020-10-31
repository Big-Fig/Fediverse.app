import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/following/account_following_account_list_page.dart';
import 'package:fedi/app/account/header/account_header_statistic_widget.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class AccountHeaderFollowingCountWidget extends StatelessWidget {
  final bool dark;

  const AccountHeaderFollowingCountWidget({@required this.dark});

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);

    return StreamBuilder<int>(
        stream: accountBloc.followingCountStream,
        initialData: accountBloc.followingCount,
        builder: (context, snapshot) {
          var followingCount = snapshot.data;
          return AccountHeaderStatisticWidget(
            label: S.of(context).app_account_info_following,
            onClick: (context) {
              goToAccountFollowingAccountListPage(context, accountBloc.account);
            },
            dark: dark,
            value: followingCount,
          );
        });
  }
}
