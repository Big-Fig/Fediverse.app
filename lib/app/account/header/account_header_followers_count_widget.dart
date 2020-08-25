import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/follower/account_follower_account_list_page.dart';
import 'package:fedi/app/account/header/account_header_statistic_widget.dart';
import 'package:flutter/cupertino.dart';

class AccountHeaderFollowersCountWidget extends StatelessWidget {
  final Color color;

  AccountHeaderFollowersCountWidget({@required this.color});

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: false);

    return StreamBuilder<int>(
        stream: accountBloc.followersCountStream,
        initialData: accountBloc.followersCount,
        builder: (context, snapshot) {
          var followersCount = snapshot.data;
          return AccountHeaderStatisticWidget(
            label: tr("app.account.info.followers"),
            onPressed: () {
              goToAccountFollowerAccountListPage(context, accountBloc.account);
            },
            color: color,
            value: followersCount,
          );
        });
  }
}
