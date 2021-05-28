import 'package:fedi/app/account/details/local_account_details_page.dart';
import 'package:fedi/app/account/my/suggestion/account_list/my_account_suggestion_account_remove_suggestion_action_button_widget.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:flutter/cupertino.dart';

class MyAccountSuggestionAccountListWidget extends StatelessWidget {
  const MyAccountSuggestionAccountListWidget();

  @override
  Widget build(BuildContext context) {
    return AccountPaginationListWidget(
      itemPadding: FediPadding.verticalMediumPadding,
      accountSelectedCallback: (context, account) =>
          goToLocalAccountDetailsPage(
        context,
        account: account,
      ),
      accountActions: [
        const MyAccountSuggestionAccountRemoveSuggestionActionButtonWidget(),
      ],
      key: PageStorageKey('MyAccountSuggestionAccountListWidget'),
    );
  }
}
