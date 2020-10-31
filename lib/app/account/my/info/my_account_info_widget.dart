import 'package:fedi/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/app/account/header/account_header_followers_count_widget.dart';
import 'package:fedi/app/account/header/account_header_following_count_widget.dart';
import 'package:fedi/app/account/header/account_header_statuses_count_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:fedi/ui/callback/on_click_ui_callback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAccountInfoWidget extends StatelessWidget {
  final OnClickUiCallback onStatusesTapCallback;

  MyAccountInfoWidget({
    this.onStatusesTapCallback,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: FediPadding.allBigPadding,
        child: Row(
          children: [
            const AccountAvatarWidget(
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
                    dark: true,
                  ),
                  const AccountHeaderFollowingCountWidget(
                    dark: true,
                  ),
                  const AccountHeaderFollowersCountWidget(
                    dark: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
