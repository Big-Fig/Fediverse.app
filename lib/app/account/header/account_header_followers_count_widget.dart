import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/follower/account_follower_account_list_page.dart';
import 'package:fedi/app/account/header/account_header_statistic_widget.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountHeaderFollowersCountWidget extends StatelessWidget {
  const AccountHeaderFollowersCountWidget();

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);
    var isLocal = accountBloc.instanceLocation.isLocal;

    return InkWell(
      onTap: isLocal
          ? () {
              goToAccountFollowerAccountListPage(
                context: context,
                account: accountBloc.account,
              );
            }
          : null,
      child: StreamBuilder<bool?>(
        stream: accountBloc.pleromaHideFollowersCountStream,
        initialData: accountBloc.pleromaHideFollowersCount,
        builder: (context, snapshot) {
          var pleromaHideFollowersCount = snapshot.data ?? false;
          if (pleromaHideFollowersCount) {
            return AccountHeaderStatisticBodyWidget(
              valueString: S.of(context).app_account_info_value_hidden,
              label: S.of(context).app_account_info_followers,
            );
          } else {
            return const _AccountHeaderFollowersCountBodyWidget();
          }
        },
      ),
    );
  }
}

class _AccountHeaderFollowersCountBodyWidget extends StatelessWidget {
  const _AccountHeaderFollowersCountBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);

    return StreamBuilder<int?>(
      stream: accountBloc.followersCountStream,
      builder: (context, snapshot) {
        var count = snapshot.data;

        return Provider<int?>.value(
          value: count,
          child: AccountHeaderStatisticWidget(
            label: S.of(context).app_account_info_followers,
          ),
        );
      },
    );
  }
}
