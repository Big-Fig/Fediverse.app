import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusHeaderWidget extends StatelessWidget {
  final String descText;
  final IconData icon;
  final IAccount account;

  @override
  Widget build(BuildContext context) => Container(
        height: 41,
        child: GestureDetector(
          onTap: () {
            goToAccountDetailsPage(context, account);
          },
          behavior: HitTestBehavior.translucent,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: buildHeader(account, context),
              ),
              FediUltraLightGreyDivider()
            ],
          ),
        ),
      );

  Row buildHeader(IAccount account, BuildContext context) {
    return Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: account.avatar,
            placeholder: (context, url) => Container(
                width: 24, height: 24, child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
            height: 24,
            width: 24,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          account.acct,
          style:
              TextStyle(fontSize: 14, color: FediColors.darkGrey, height: 1.15),
        ),
        SizedBox(
          width: 12,
        ),
        Row(
          children: <Widget>[
            Icon(
              icon,
              size: 16,
              color: FediColors.grey,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              descText,
              style: TextStyle(
                fontSize: 12,
                color: FediColors.darkGrey,
              ),
            )
          ],
        )
      ],
    );
  }

  const StatusHeaderWidget(
      {@required this.account, @required this.descText, @required this.icon});
}
