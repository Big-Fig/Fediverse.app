import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/details/local_account_details_page.dart';
import 'package:fedi/app/account/details/remote_account_details_page.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusSubHeaderWidget extends StatelessWidget {
  final String descText;
  final IconData icon;
  final IAccount account;
  final AccountCallback? accountCallback;

  StatusSubHeaderWidget({
    required this.account,
    required this.descText,
    required this.icon,
    this.accountCallback,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: FediSizes.statusSubHeaderHeight,
        child: GestureDetector(
          onTap: () {
            if (accountCallback != null) {
              accountCallback!(context, account);
            } else {
              var statusBloc = IStatusBloc.of(context, listen: false);
              var isLocal = statusBloc.instanceLocation == InstanceLocation.local;
              if (isLocal) {
                goToLocalAccountDetailsPage(
                  context,
                  account: account,
                );
              } else {
                goToRemoteAccountDetailsPageBasedOnRemoteInstanceAccount(
                  context,
                  remoteInstanceAccount: account,
                );
              }
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
          size: FediSizes.defaultIconSize,
          color: IFediUiColorTheme.of(context).mediumGrey,
        ),
        const FediSmallHorizontalSpacer(),
        Text(
          "$descText ",
          style: IFediUiTextTheme.of(context)
              .mediumShortMediumGrey
              .copyWith(height: 1),
        ),
        Flexible(
          child: Text(
            account.acct!,
            overflow: TextOverflow.ellipsis,
            style: IFediUiTextTheme.of(context)
                .mediumShortDarkGrey
                .copyWith(height: 1),
          ),
        ),
      ],
    );
  }
}
