import 'package:fedi/app/account/details/local_account_details_page.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:flutter/cupertino.dart';

class InstanceDirectoryAccountListWidget extends StatelessWidget {
  const InstanceDirectoryAccountListWidget();

  @override
  Widget build(BuildContext context) {
    return AccountPaginationListWidget(
      itemPadding: FediPadding.verticalMediumPadding,
      accountSelectedCallback: (context, account) =>
          goToLocalAccountDetailsPage(
        context,
        account: account,
      ),
      key: PageStorageKey('InstanceDirectoryAccountListWidget'),
    );
  }
}
