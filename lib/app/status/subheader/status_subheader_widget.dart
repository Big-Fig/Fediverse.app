import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusSubHeaderWidget extends StatelessWidget {
  final String descText;
  final IconData icon;
  final IAccount account;

  @override
  Widget build(BuildContext context) => Container(
        height: 16,
        child: GestureDetector(
          onTap: () {
            goToAccountDetailsPage(context, account);
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
        SizedBox(
          width: 8,
        ),
        Text(
          descText,
          style: TextStyle(
              fontSize: 14, color: FediColors.mediumGrey, height: 1.15),
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          account.acct,
          style:
              TextStyle(fontSize: 14, color: FediColors.darkGrey, height: 1.15),
        ),
      ],
    );
  }

  const StatusSubHeaderWidget(
      {@required this.account, @required this.descText, @required this.icon});
}
