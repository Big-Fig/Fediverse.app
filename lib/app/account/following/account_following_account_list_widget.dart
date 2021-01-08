import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi/app/ui/empty/fedi_empty_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountFollowingAccountListWidget extends StatelessWidget {
  const AccountFollowingAccountListWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var account = Provider.of<IAccount>(context);

    if (account.pleromaHideFollows == true) {
      return const _AccountFollowingAccountListEmptyWidget();
    } else {
      return const _AccountFollowingAccountListBodyWidget();
    }
  }
}

class _AccountFollowingAccountListEmptyWidget extends StatelessWidget {
  const _AccountFollowingAccountListEmptyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FediEmptyWidget(
        title: S.of(context).app_account_info_value_hidden,
      ),
    );
  }
}

class _AccountFollowingAccountListBodyWidget extends StatelessWidget {
  const _AccountFollowingAccountListBodyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: FediPadding.allBigPadding,
          child: Text(
            S.of(context).app_account_list_privacy,
            textAlign: TextAlign.center,
            style: IFediUiTextTheme.of(context).mediumShortBoldGrey,
          ),
        ),
        const Expanded(
          child: AccountPaginationListWidget(
            accountSelectedCallback: goToAccountDetailsPage,
            key: PageStorageKey("AccountFollowingAccountListPage"),
          ),
        ),
      ],
    );
  }
}
