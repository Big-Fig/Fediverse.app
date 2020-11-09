import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/following/account_following_account_list_page.dart';
import 'package:fedi/app/account/header/account_header_statistic_widget.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AccountHeaderFollowingCountWidget extends StatelessWidget {
  const AccountHeaderFollowingCountWidget();

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);

    return StreamBuilder<int>(
      stream: accountBloc.followingCountStream,
      builder: (context, snapshot) {
        var count = snapshot.data;
        return Provider<int>.value(
          value: count,
          child: AccountHeaderStatisticWidget(
            label: S.of(context).app_account_info_following,
            onClick: (context) {
              goToAccountFollowingAccountListPage(context, accountBloc.account);
            },
          ),
        );
      },
    );
  }
}
