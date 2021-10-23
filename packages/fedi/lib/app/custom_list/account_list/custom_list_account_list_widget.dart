import 'package:fedi/app/account/details/local_account_details_page.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:flutter/cupertino.dart';

class CustomListAccountListWidget extends StatelessWidget {
  final List<Widget> itemActions;

  const CustomListAccountListWidget({
    Key? key,
    required this.itemActions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AccountPaginationListWidget(
        itemPadding: FediPadding.verticalMediumPadding,
        accountActions: itemActions,
        accountSelectedCallback: (context, account) =>
            goToLocalAccountDetailsPage(
          context,
          account: account,
        ),
        key: const PageStorageKey('CustomListAccountListWidget'),
      );
}
