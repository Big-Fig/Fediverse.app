import 'package:fedi_app/app/account/details/local_account_details_page.dart';
import 'package:fedi_app/app/account/my/suggestion/account_list/my_account_suggestion_account_remove_suggestion_action_button_widget.dart';
import 'package:fedi_app/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:flutter/cupertino.dart';

class MyAccountSuggestionAccountListWidget extends StatelessWidget {
  const MyAccountSuggestionAccountListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AccountPaginationListWidget(
        itemPadding: FediPadding.verticalMediumPadding,
        accountSelectedCallback: (context, account) =>
            goToLocalAccountDetailsPage(
          context,
          account: account,
        ),
        accountActions: const [
          MyAccountSuggestionAccountRemoveSuggestionActionButtonWidget(),
        ],
        key: const PageStorageKey('MyAccountSuggestionAccountListWidget'),
      );
}
