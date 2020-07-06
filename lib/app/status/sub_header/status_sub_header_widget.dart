import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusSubHeaderWidget extends StatelessWidget {
  final String descText;
  final IconData icon;
  final IAccount account;
  final AccountCallback accountCallback;

  @override
  Widget build(BuildContext context) => Container(
        height: 16,
        child: GestureDetector(
          onTap: () {
            if (accountCallback != null) {
              accountCallback(context, account);
            } else {
              goToAccountDetailsPage(context, account);
            }
          },
          behavior: HitTestBehavior.translucent,
          child: buildHeader(account, context),
        ),
      );

  Row buildHeader(IAccount account, BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          size: 16,
          color: FediColors.mediumGrey,
        ),
        const FediSmallHorizontalSpacer(),
        Text(
          descText,
          style: TextStyle(
              fontSize: 14, color: FediColors.mediumGrey, height: 1.15),
        ),
        SizedBox(
          width: 4,
        ),
        Flexible(
          child: Text(
            account.acct,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 14, color: FediColors.darkGrey, height: 1.15),
          ),
        ),
      ],
    );
  }

  StatusSubHeaderWidget({
    @required this.account,
    @required this.descText,
    @required this.icon,
    this.accountCallback,
  });
}
