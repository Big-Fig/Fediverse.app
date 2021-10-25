import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/details/local_account_details_page.dart';
import 'package:fedi_app/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:flutter/widgets.dart';

class SearchAccountsListWidget extends StatelessWidget {
  const SearchAccountsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const AccountPaginationListWidget(
        needWatchLocalRepositoryForUpdates: false,
        accountSelectedCallback: _accountSelectedCallback,
        key: PageStorageKey('SearchAccountsListWidget'),
      );
}

void _accountSelectedCallback(BuildContext context, IAccount account) {
  goToLocalAccountDetailsPage(
    context,
    account: account,
  );
}
