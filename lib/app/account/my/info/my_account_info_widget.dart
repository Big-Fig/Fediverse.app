import 'dart:ui';

import 'package:fedi/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/app/account/header/account_header_followers_count_widget.dart';
import 'package:fedi/app/account/header/account_header_following_count_widget.dart';
import 'package:fedi/app/account/header/account_header_statuses_count_widget.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAccountInfoWidget extends StatelessWidget {
  final VoidCallback onStatusesTapCallback;

  MyAccountInfoWidget({this.onStatusesTapCallback});

  @override
  Widget build(BuildContext context) => Padding(
        padding: FediPadding.allBigPadding,
        child: Row(
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
                    color: IFediUiColorTheme.of(context).darkGrey,
                  ),
                  AccountHeaderFollowingCountWidget(
                    color: IFediUiColorTheme.of(context).darkGrey,
                  ),
                  AccountHeaderFollowersCountWidget(
                    color: IFediUiColorTheme.of(context).darkGrey,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
