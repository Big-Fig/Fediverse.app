import 'dart:ui';
import 'package:fedi/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/app/account/display_name/account_display_name_widget.dart';
import 'package:fedi/app/account/header/account_header_background_widget.dart';
import 'package:fedi/app/account/header/account_header_followers_count_widget.dart';
import 'package:fedi/app/account/header/account_header_followings_count_widget.dart';
import 'package:fedi/app/account/header/account_header_statuses_count_widget.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountInfoWidget extends StatelessWidget {
  final VoidCallback onStatusesTapCallback;

  AccountInfoWidget({this.onStatusesTapCallback});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0.0,
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: AccountHeaderBackgroundWidget(),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AccountDisplayNameWidget(
                textOverflow: TextOverflow.visible,
                textStyle: TextStyle(
                  color: FediColors.white,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: AccountAvatarWidget(
                  imageSize: 60,
                  progressSize: 30,
                ),
              ),
              AccountHeaderStatusesCountWidget(
                onStatusesTapCallback: onStatusesTapCallback,
                color: FediColors.white,
              ),
              AccountHeaderFollowingsCountWidget(
                color: FediColors.white,
              ),
              AccountHeaderFollowersCountWidget(
                color: FediColors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
