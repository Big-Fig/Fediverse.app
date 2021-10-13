import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/details/local_account_details_page.dart';
import 'package:fedi/app/account/details/remote_account_details_page.dart';
import 'package:fedi/app/cache/files/files_cache_service.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/spacer/fedi_medium_horizontal_spacer.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _statusHeaderHeight = 41.0;

class StatusHeaderWidget extends StatelessWidget {
  final String descText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    var account = Provider.of<IAccount>(context);

    return Container(
      height: _statusHeaderHeight,
      child: GestureDetector(
        onTap: () {
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
        },
        behavior: HitTestBehavior.translucent,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: FediSizes.smallPadding,
                horizontal: FediSizes.bigPadding,
              ),
              child: buildHeader(account, context),
            ),
            const FediUltraLightGreyDivider(),
          ],
        ),
      ),
    );
  }

  Row buildHeader(IAccount account, BuildContext context) => Row(
        children: <Widget>[
          ClipRRect(
            // todo: refactor
            // ignore: no-magic-number
            borderRadius: BorderRadius.circular(12.0),
            child:
                IFilesCacheService.of(context).createCachedNetworkImageWidget(
              imageUrl: account.avatar,
              placeholder: (context, url) => Container(
                width: FediSizes.accountAvatarSmallSize,
                // ignore: no-equal-arguments
                height: FediSizes.accountAvatarSmallSize,
                child: const FediCircularProgressIndicator(
                  size: FediSizes.accountAvatarSmallSize,
                ),
              ),
              errorWidget: (context, url, dynamic error) => Icon(
                FediIcons.warning,
              ),
              height: FediSizes.accountAvatarProgressSmallSize,
              // ignore: no-equal-arguments
              width: FediSizes.accountAvatarProgressSmallSize,
            ),
          ),
          const FediSmallHorizontalSpacer(),
          Text(
            account.acct,
            style: IFediUiTextTheme.of(context).mediumShortDarkGrey,
          ),
          const FediMediumHorizontalSpacer(),
          Icon(
            icon,
            // todo: refactor
            // ignore: no-magic-number
            size: 16,
            color: IFediUiColorTheme.of(context).grey,
          ),
          const FediMediumHorizontalSpacer(),
          Flexible(
            child: Text(
              descText,
              overflow: TextOverflow.ellipsis,
              style: IFediUiTextTheme.of(context).smallShortDarkGrey,
            ),
          ),
        ],
      );

  const StatusHeaderWidget({
    required this.descText,
    required this.icon,
  });
}
