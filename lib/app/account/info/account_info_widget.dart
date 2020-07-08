import 'dart:ui';

import 'package:fedi/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/app/account/header/account_header_followers_count_widget.dart';
import 'package:fedi/app/account/header/account_header_following_count_widget.dart';
import 'package:fedi/app/account/header/account_header_statuses_count_widget.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountInfoWidget extends StatelessWidget {
  final VoidCallback onStatusesTapCallback;

  AccountInfoWidget({this.onStatusesTapCallback});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              AccountAvatarWidget(
                imageSize: FediSizes.accountAvatarBigSize,
                progressSize: FediSizes.accountAvatarProgressBigSize,
              ),
              const FediSmallHorizontalSpacer(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    AccountHeaderStatusesCountWidget(
                      onStatusesTapCallback: onStatusesTapCallback,
                      color: FediColors.white,
                    ),
                    AccountHeaderFollowingCountWidget(
                      color: FediColors.white,
                    ),
                    AccountHeaderFollowersCountWidget(
                      color: FediColors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
}
