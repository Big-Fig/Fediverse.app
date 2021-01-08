import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/following/account_following_account_list_page.dart';
import 'package:fedi/app/account/header/account_header_statistic_widget.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountHeaderFollowingCountWidget extends StatelessWidget {
  const AccountHeaderFollowingCountWidget();

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);

    return InkWell(
      onTap: () {
        goToAccountFollowingAccountListPage(context, accountBloc.account);
      },
      child: StreamBuilder<bool>(
        stream: accountBloc.pleromaHideFollowsCountStream,
        initialData: accountBloc.pleromaHideFollowsCount,
        builder: (context, snapshot) {
          var pleromaHideFollowsCount = snapshot.data ?? false;
          if (pleromaHideFollowsCount) {
            return AccountHeaderStatisticBodyWidget(
              valueString: S.of(context).app_account_info_value_hidden,
              label: S.of(context).app_account_info_following,
            );
          } else {
            return const _AccountHeaderFollowingCountBodyWidget();
          }
        },
      ),
    );
  }
}

class _AccountHeaderFollowingCountBodyWidget extends StatelessWidget {
  const _AccountHeaderFollowingCountBodyWidget({
    Key key,
  }) : super(key: key);

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
          ),
        );
      },
    );
  }
}
