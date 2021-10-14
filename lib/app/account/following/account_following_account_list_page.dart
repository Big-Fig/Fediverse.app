import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/following/account_following_account_cached_list_bloc_impl.dart';
import 'package:fedi/app/account/following/account_following_account_list_widget.dart';
import 'package:fedi/app/account/pagination/cached/account_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountFollowingAccountListPage extends StatelessWidget {
  const AccountFollowingAccountListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var account = Provider.of<IAccount>(context);

    return Scaffold(
      appBar: FediPageTitleAppBar(
        title: S.of(context).app_account_following_title(
              account.acct,
            ),
      ),
      body: const SafeArea(
        child: AccountFollowingAccountListWidget(),
      ),
    );
  }
}

void goToAccountFollowingAccountListPage({
  required BuildContext context,
  required IAccount account,
}) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (context) =>
          AccountFollowingAccountCachedListBloc.provideToContext(
        context,
        account: account,
        child: AccountCachedPaginationBloc.provideToContext(
          context,
          child: AccountPaginationListBloc.provideToContext(
            context,
            child: Provider<IAccount>.value(
              value: account,
              child: const AccountFollowingAccountListPage(),
            ),
          ),
        ),
      ),
    ),
  );
}
