import 'dart:ui';

import 'package:fedi/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/app/account/header/account_header_followers_count_widget.dart';
import 'package:fedi/app/account/header/account_header_followings_count_widget.dart';
import 'package:fedi/app/account/header/account_header_statuses_count_widget.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAccountInfoWidget extends StatelessWidget {
  final VoidCallback onStatusesTapCallback;

  MyAccountInfoWidget({this.onStatusesTapCallback});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            AccountAvatarWidget(
              imageSize: 48,
              progressSize: 25,
            ),
            SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  AccountHeaderStatusesCountWidget(
                    onStatusesTapCallback: onStatusesTapCallback,
                    color: FediColors.darkGrey,
                  ),
                  AccountHeaderFollowingsCountWidget(
                    color: FediColors.darkGrey,
                  ),
                  AccountHeaderFollowersCountWidget(
                    color: FediColors.darkGrey,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
