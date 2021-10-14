import 'package:fedi/app/access/current/current_access_bloc.dart';
import 'package:fedi/app/account/my/featured_hashtag/my_account_featured_hashtag_bloc.dart';
import 'package:fedi/app/account/my/featured_hashtag/my_account_featured_hashtag_model.dart';
import 'package:fedi/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/page/local/local_hashtag_page.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_transparent_text_button_with_border.dart';
import 'package:fedi/app/ui/divider/fedi_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/statistic/fedi_statistic_item_widget.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountFeaturedHashtagListItemWidget extends StatelessWidget {
  const AccountFeaturedHashtagListItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountFeaturedHashtag =
        Provider.of<IMyAccountFeaturedHashtag>(context);

    var currentUnifediApiAccessBloc = ICurrentUnifediApiAccessBloc.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                goToLocalHashtagPage(
                  context: context,
                  hashtag: Hashtag(
                    name: accountFeaturedHashtag.name,
                    url: currentUnifediApiAccessBloc.createHashtagUrl(
                      hashtag: accountFeaturedHashtag.name,
                    ),
                    history: null,
                  ),
                  myAccountFeaturedHashtag: accountFeaturedHashtag,
                );
              },
              child: const Padding(
                padding: FediPadding.allSmallPadding,
                child: _AccountFeaturedHashtagListItemNameWidget(),
              ),
            ),
            const _AccountFeaturedHashtagListItemRightWidget(),
          ],
        ),
        const FediLightGreyDivider(),
      ],
    );
  }
}

class _AccountFeaturedHashtagListItemRightWidget extends StatelessWidget {
  const _AccountFeaturedHashtagListItemRightWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          // todo: can't test so disabled temporary
          // const _AccountFeaturedHashtagListItemLastStatusAtWidget(),
          _AccountFeaturedHashtagListItemStatusesCountWidget(),
          _AccountFeaturedHashtagListItemUnfeatureWidget(),
        ],
      );
}

class _AccountFeaturedHashtagListItemNameWidget extends StatelessWidget {
  const _AccountFeaturedHashtagListItemNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountFeaturedHashtag =
        Provider.of<IMyAccountFeaturedHashtag>(context);

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

class _AccountFeaturedHashtagListItemStatusesCountWidget
    extends StatelessWidget {
  const _AccountFeaturedHashtagListItemStatusesCountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountFeaturedHashtag =
        Provider.of<IMyAccountFeaturedHashtag>(context);

    return FediStatisticItemWidget(
      label: S.of(context).app_account_my_featuredTags_metadata_statusesCount,
      valueString: accountFeaturedHashtag.statusesCount.toString(),
      color: IFediUiColorTheme.of(context).darkGrey,
    );
  }
}
//
// class _AccountFeaturedHashtagListItemLastStatusAtWidget
//     extends StatelessWidget {
//   static final _dateFormat = DateFormat('dd MMM');
//   const _AccountFeaturedHashtagListItemLastStatusAtWidget({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var accountFeaturedHashtag =
//         Provider.of<IMyAccountFeaturedHashtag>(context);
//
//     var lastStatusAt = accountFeaturedHashtag.lastStatusAt;
//
//     if (lastStatusAt == null) {
//       return const SizedBox.shrink();
//     }
//
//     return Provider<IAccountHeaderBloc>.value(
//       value: AccountHeaderBloc(brightness: Brightness.dark),
//       child: AccountHeaderStatisticBodyWidget(
//         valueString: _dateFormat.format(accountFeaturedHashtag.lastStatusAt!),
//         label: S.of(context).app_account_my_featuredTags_metadata_lastStatusAt,
//       ),
//     );
//   }
// }

class _AccountFeaturedHashtagListItemUnfeatureWidget extends StatelessWidget {
  const _AccountFeaturedHashtagListItemUnfeatureWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myAccountFeaturedHashtagBloc =
        IMyAccountFeaturedHashtagBloc.of(context);

    return Padding(
      padding: FediPadding.horizontalSmallPadding,
      child: StreamBuilder<bool>(
        stream: myAccountFeaturedHashtagBloc.unFeaturedStream,
        initialData: myAccountFeaturedHashtagBloc.unFeatured,
        builder: (context, snapshot) {
          var unFeatured = snapshot.data!;

          return AsyncOperationButtonBuilderWidget(
            builder: (context, onPressed) =>
                FediTransparentTextButtonWithBorder(
              unFeatured
                  ? S.of(context).app_account_my_featuredTags_action_feature
                  : S.of(context).app_account_my_featuredTags_action_unfeature,
              onPressed: onPressed,
              color: unFeatured
                  ? IFediUiColorTheme.of(context).primary
                  : IFediUiColorTheme.of(context).darkGrey,
              expanded: false,
            ),
            asyncButtonAction: () async {
              if (unFeatured) {
                await myAccountFeaturedHashtagBloc.featureAgain();
              } else {
                await myAccountFeaturedHashtagBloc.unFeature();
              }
            },
          );
        },
      ),
    );
  }
}
