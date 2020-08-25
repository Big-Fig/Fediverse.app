import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/following/account_following_account_list_page.dart';
import 'package:fedi/app/account/header/account_header_statistic_widget.dart';
import 'package:flutter/cupertino.dart';

class AccountHeaderFollowingCountWidget extends StatelessWidget {
  final Color color;

  AccountHeaderFollowingCountWidget({@required this.color});

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: false);

    return StreamBuilder<int>(
        stream: accountBloc.followingCountStream,
        initialData: accountBloc.followingCount,
        builder: (context, snapshot) {
          var followingCount = snapshot.data;
          return AccountHeaderStatisticWidget(
            label: tr("app.account.info.following"),
            onPressed: () {
              goToAccountFollowingAccountListPage(context, accountBloc.account);
            },
            color: color, value: followingCount,
          );
        });
  }
}
