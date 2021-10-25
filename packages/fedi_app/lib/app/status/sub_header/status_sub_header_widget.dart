import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/details/local_account_details_page.dart';
import 'package:fedi_app/app/account/details/remote_account_details_page.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/status/status_bloc.dart';
import 'package:fedi_app/app/ui/fedi_sizes.dart';
import 'package:fedi_app/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusSubHeaderWidget extends StatelessWidget {
  final String descText;
  final IconData icon;
  final IAccount account;
  final AccountCallback? accountCallback;

  const StatusSubHeaderWidget({
    Key? key,
    required this.account,
    required this.descText,
    required this.icon,
    this.accountCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: FediSizes.statusSubHeaderHeight,
        child: GestureDetector(
          onTap: () {
            if (accountCallback != null) {
              accountCallback!(context, account);
            } else {
              var statusBloc = IStatusBloc.of(context, listen: false);
              var isLocal =
                  statusBloc.instanceLocation == InstanceLocation.local;
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
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: FediSizes.defaultIconSize,
                color: IFediUiColorTheme.of(context).mediumGrey,
              ),
              const FediSmallHorizontalSpacer(),
              Text(
                '$descText ',
                style: IFediUiTextTheme.of(context)
                    .mediumShortMediumGrey
                    .copyWith(height: 1),
              ),
              Flexible(
                child: Text(
                  account.acct,
                  overflow: TextOverflow.ellipsis,
                  style: IFediUiTextTheme.of(context)
                      .mediumShortDarkGrey
                      .copyWith(height: 1),
                ),
              ),
            ],
          ),
        ),
      );
}
