import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusHeaderWidget extends StatelessWidget {
  final String descText;
  final IAccount account;

  @override
  Widget build(BuildContext context) => Container(
    height: 45,
    child: GestureDetector(
          onTap: () {
            goToAccountDetailsPage(context, account);
          },
          behavior: HitTestBehavior.translucent,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: buildHeader(account, context),
              ),
              Container(
                  width: double.infinity,
                  height: 1,
                  color: FediColors.ultraLightGrey)
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
                width: 24,
                height: 24,
                child: CircularProgressIndicator()),
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
          style: TextStyle(fontSize: 12, color: FediColors.darkGrey),
        ),
        SizedBox(
          width: 8,
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.repeat,
              color: FediColors.grey,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              descText,
              style: TextStyle(
                fontSize: 12,
                color: FediColors.grey,
              ),
            )
          ],
        )
      ],
    );
  }

  const StatusHeaderWidget({this.account, this.descText});
}
