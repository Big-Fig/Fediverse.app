import 'package:fedi/refactored/app/account/details/account_details_page.dart';
import 'package:fedi/refactored/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:flutter/widgets.dart';


class SearchAccountsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountPaginationListWidget(
      accountSelectedCallback: (account) {
        goToAccountDetailsPage(context, account);
      },
      key: PageStorageKey("SearchAccountsListWidget"),
    );
  }

}