import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/account/follower/account_follower_account_cached_list_bloc_impl.dart';
import 'package:fedi/app/account/pagination/cached/account_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountFollowerAccountListPage extends StatelessWidget {
  final IAccount account;

  AccountFollowerAccountListPage({@required this.account});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: tr(
          "app.account.follower.title",
          args: [account.acct],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: FediPadding.allBigPadding,
              child: Text(
                "app.account.list.privacy".tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: FediColors.grey),
              ),
            ),
            Expanded(
              child: AccountPaginationListWidget(
                accountSelectedCallback: (context, account) =>
                    goToAccountDetailsPage(context, account),
                key: PageStorageKey("AccountFollowerAccountListPage"),
              ),
            ),
          ],
        ),
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
