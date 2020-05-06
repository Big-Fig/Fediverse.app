import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/refactored/app/account/header/account_header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: false);
    return Container(
      height: 130,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FittedBox(
            fit: BoxFit.none,
            child: AccountHeaderWidget(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 80,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    AccountAvatarWidget(),
                    buildStatusesCountWidget(accountBloc),
                    buildFollowingCountWidget(accountBloc),
                    buildFollowersCountWidget(accountBloc),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  StreamBuilder<int> buildFollowersCountWidget(
      IAccountBloc accountBloc) {
    return StreamBuilder<int>(
        stream: accountBloc.followersCountStream,
        initialData: accountBloc.followersCount,
        builder: (context, snapshot) {
          var followersCount = snapshot.data;
          return buildStatisticValueWidget(AppLocalizations.of(context).tr(
              "app.account.info.followers",
              args: [followersCount.toString()]));
        });
  }

  StreamBuilder<int> buildFollowingCountWidget(
      IAccountBloc accountBloc) {
    return StreamBuilder<int>(
        stream: accountBloc.followingCountStream,
        initialData: accountBloc.followingCount,
        builder: (context, snapshot) {
          var followingCount = snapshot.data;
          return buildStatisticValueWidget(AppLocalizations.of(context).tr(
              "app.account.info.following",
              args: [followingCount.toString()]));
        });
  }

  StreamBuilder<int> buildStatusesCountWidget(
      IAccountBloc accountBloc) {
    return StreamBuilder<int>(
        stream: accountBloc.statusesCountStream,
        initialData: accountBloc.statusesCount,
        builder: (context, snapshot) {
          var statusesCount = snapshot.data;
          return buildStatisticValueWidget(AppLocalizations.of(context).tr(
              "app.account.info.statuses",
              args: [statusesCount.toString()]));
        });
  }

  Container buildStatisticValueWidget(String formattedValue) {
    return Container(
      color: Colors.black38,
      child: Padding(
        padding: EdgeInsets.all(3),
        child: Text(
          formattedValue,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
