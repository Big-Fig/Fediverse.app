import 'package:fedi/app/account/featured_hashtag/account_featured_hashtag_model.dart';
import 'package:fedi/app/ui/divider/fedi_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountFeaturedHashtagListItemWidget extends StatelessWidget {
  const AccountFeaturedHashtagListItemWidget();

  @override
  Widget build(BuildContext context) {
    var accountFeaturedHashtag = Provider.of<IAccountFeaturedHashtag>(context);

    return InkWell(
      onTap: () {
        // goToAccountFeaturedHashtagPage(
        //     context: context, accountFeaturedHashtag: accountFeaturedHashtag);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _AccountFeaturedHashtagListItemNameWidget(),
            ],
          ),
          const FediLightGreyDivider(),
        ],
      ),
    );
  }
}

class _AccountFeaturedHashtagListItemNameWidget extends StatelessWidget {
  const _AccountFeaturedHashtagListItemNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountFeaturedHashtag = Provider.of<IAccountFeaturedHashtag>(context);

    return Padding(
      padding: FediPadding.allBigPadding,
      child: Text(
        '#${accountFeaturedHashtag.name}',
        textAlign: TextAlign.left,
        style: IFediUiTextTheme.of(context).mediumShortDarkGrey,
      ),
    );
  }
}

class _AccountFeaturedHashtagListItemStatusesWidget extends StatelessWidget {
  const _AccountFeaturedHashtagListItemStatusesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
    // var accountFeaturedHashtag = Provider.of<IAccountFeaturedHashtag>(context);
    // var history = accountFeaturedHashtag.history;
    //
    // if (history?.isNotEmpty != true) {
    //   return const SizedBox.shrink();
    // }
    //
    // return AccountHeaderStatisticBodyWidget(
    //   valueString: history!.first.uses.toString(),
    //   label: S.of(context).app_accountFeaturedHashtag_history_statuses,
    // );
  }
}
