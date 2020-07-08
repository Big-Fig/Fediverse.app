import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/spacer/fedi_middle_horizontal_spacer.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var _statusHeaderHeight = 41.0;

class StatusHeaderWidget extends StatelessWidget {
  final String descText;
  final IconData icon;
  final IAccount account;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _statusHeaderHeight,
      child: GestureDetector(
        onTap: () {
          goToAccountDetailsPage(context, account);
        },
        behavior: HitTestBehavior.translucent,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: FediSizes.smallPadding,
                  horizontal: FediSizes.bigPadding),
              child: buildHeader(account, context),
            ),
            FediUltraLightGreyDivider()
          ],
        ),
      ),
    );
  }

  Row buildHeader(IAccount account, BuildContext context) {
    return Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: account.avatar,
            placeholder: (context, url) => Container(
                width: FediSizes.accountAvatarSmallSize,
                height: FediSizes.accountAvatarSmallSize,
                child: FediCircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
            height: FediSizes.accountAvatarProgressSmallSize,
            width: FediSizes.accountAvatarProgressSmallSize,
          ),
        ),
        const FediSmallHorizontalSpacer(),
        Text(
          account.acct,
          style:
              TextStyle(fontSize: 14, color: FediColors.darkGrey, height: 1.15),
        ),
        FediMiddleHorizontalSpacer(),
        Icon(
          icon,
          size: 16,
          color: FediColors.grey,
        ),
        FediMiddleHorizontalSpacer(),
        Flexible(
          child: Text(
            descText,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              color: FediColors.darkGrey,
            ),
          ),
        )
      ],
    );
  }

  const StatusHeaderWidget(
      {@required this.account, @required this.descText, @required this.icon});
}
