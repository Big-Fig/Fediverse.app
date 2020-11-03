import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:flutter/widgets.dart';

class SearchAccountsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const AccountPaginationListWidget(
        needWatchLocalRepositoryForUpdates: false,
        accountSelectedCallback: _accountSelectedCallback,
        key: PageStorageKey("SearchAccountsListWidget"),
      );

  const SearchAccountsListWidget();
}

void _accountSelectedCallback(BuildContext context, IAccount account) {
  goToAccountDetailsPage(context, account);
}
