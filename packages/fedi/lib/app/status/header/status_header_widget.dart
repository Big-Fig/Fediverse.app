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

  const StatusHeaderWidget({
    Key? key,
    required this.descText,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var account = Provider.of<IAccount>(context);

    return SizedBox(
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
              padding: const EdgeInsets.symmetric(
                vertical: FediSizes.smallPadding,
                horizontal: FediSizes.bigPadding,
              ),
              child: _StatusHeaderWidgetBody(icon: icon, descText: descText),
            ),
            const FediUltraLightGreyDivider(),
          ],
        ),
      ),
    );
  }
}

class _StatusHeaderWidgetBody extends StatelessWidget {
  const _StatusHeaderWidgetBody({
    Key? key,
    required this.icon,
    required this.descText,
  }) : super(key: key);

  final IconData icon;
  final String descText;

  @override
  Widget build(BuildContext context) {
    var account = Provider.of<IAccount>(context);

    return Row(
      children: <Widget>[
        ClipRRect(
          // todo: refactor
          // ignore: no-magic-number
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          child: IFilesCacheService.of(context).createCachedNetworkImageWidget(
            imageUrl: account.avatar,
            placeholder: (context, url) => const SizedBox(
              width: FediSizes.accountAvatarSmallSize,
              // ignore: no-equal-arguments
              height: FediSizes.accountAvatarSmallSize,
              child: FediCircularProgressIndicator(
                size: FediSizes.accountAvatarSmallSize,
              ),
            ),
            errorWidget: (context, url, dynamic error) => const Icon(
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
  }
}
