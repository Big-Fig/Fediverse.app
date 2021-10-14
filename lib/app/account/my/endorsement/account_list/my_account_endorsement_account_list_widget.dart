import 'package:fedi/app/account/details/local_account_details_page.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:flutter/cupertino.dart';

class MyAccountEndorsementAccountListWidget extends StatelessWidget {
  const MyAccountEndorsementAccountListWidget();

  @override
  Widget build(BuildContext context) => AccountPaginationListWidget(
        itemPadding: FediPadding.verticalMediumPadding,
        accountSelectedCallback: (context, account) =>
            goToLocalAccountDetailsPage(
          context,
          account: account,
        ),
        key: const PageStorageKey('MyAccountEndorsementAccountListWidget'),
      );
}
