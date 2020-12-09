import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/account/follower/account_follower_account_cached_list_bloc_impl.dart';
import 'package:fedi/app/account/pagination/cached/account_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountFollowerAccountListPage extends StatelessWidget {
  final IAccount account;

  const AccountFollowerAccountListPage({@required this.account});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediPageTitleAppBar(
        title: S.of(context).app_account_follower_title(account.acct)
      ),
      body: const _AccountFollowerAccountListBodyPage(),
    );
  }
}

class _AccountFollowerAccountListBodyPage extends StatelessWidget {
  const _AccountFollowerAccountListBodyPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
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
              key: PageStorageKey("AccountFollowerAccountListPage"),
            ),
          ),
        ],
      ),
    );
  }
}

void goToAccountFollowerAccountListPage(
    BuildContext context, IAccount account) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) {
      return AccountFollowerAccountCachedListBloc.provideToContext(
        context,
        account: account,
        child: AccountCachedPaginationBloc.provideToContext(
          context,
          child: AccountPaginationListBloc.provideToContext(
            context,
            child: AccountFollowerAccountListPage(
              account: account,
            ),
          ),
        ),
      );
    }),
  );
}
