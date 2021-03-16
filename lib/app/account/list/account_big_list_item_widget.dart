import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/acct/account_acct_widget.dart';
import 'package:fedi/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/app/account/display_name/account_display_name_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/spacer/fedi_medium_vertical_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("account_big_list_item_widget.dart");

class AccountBigListItemWidget extends StatelessWidget {
  final AccountCallback? accountSelectedCallback;
  final List<Widget>? accountActions;

  const AccountBigListItemWidget({
    required this.accountSelectedCallback,
    this.accountActions,
  });

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);
    _logger.finest(() => "build ${accountBloc.acct}");

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        var callback = accountSelectedCallback;
        if (callback != null) {
          callback(context, accountBloc.account!);
        }
      },
      child: Padding(
        padding: FediPadding.allBigPadding,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const AccountAvatarWidget(
                    imageSize: FediSizes.accountAvatarGiantSize,
                    progressSize: FediSizes.accountAvatarProgressGiantSize,
                  ),
                  const FediBigHorizontalSpacer(),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AccountDisplayNameWidget(
                          textStyle:
                              IFediUiTextTheme.of(context).bigBoldDarkGrey,
                        ),
                        AccountAcctWidget(
                          textStyle:
                              IFediUiTextTheme.of(context).mediumShortDarkGrey,
                        ),
                        if (accountActions?.isNotEmpty == true)
                          const FediMediumVerticalSpacer(),
                        if (accountActions?.isNotEmpty == true)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ...accountActions!,
                            ],
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
